# frozen_string_literal: true

require 'httparty'

# TMDb API Client, responsible for fetching movie data from the TMDb API
module OmdtApiClient
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  # Adds YouTube trailers to a given movie
  def self.add_youtube_trailers(movie)
    return if api_key.empty?
    trailer_attributes = youtube_trailers_attributes(movie.Title)
    trailer_attributes.each do |trailer_attr|
      unless movie.youtube_trailers.exists?(key: trailer_attr[:key])
        movie.youtube_trailers.build(trailer_attr)
      end
    end
    movie.save
  end

  private

  # Builds an array of trailer attributes for a given movie title
  def self.youtube_trailers_attributes(movie_title)
  
    by_title(movie_title).map do |trailer|
      {
        name: trailer["name"],
        key: trailer["key"],
        backdrop_path: trailer["backdrop_path"] 
      }
    end
  end

  # Searches for movies by title
  def self.by_title(movie_title)
    response = get("/search/movie", query: { api_key: api_key, query: movie_title })

    return nil unless response.code == 200 # Checking response code for success

    results = JSON.parse(response.body)['results']
    return nil if results.empty?

    results = results.map { |movie| trailers(movie['id'], movie['backdrop_path']) }
    results.reject(&:nil?).flatten
  end

  # Retrieves trailers for a given movie
  def self.trailers(movie_id, backdrop_path = nil)
    return nil unless movie_id

    response = get("/movie/#{movie_id}/videos", query: { api_key: api_key })
    return nil unless response.code == 200 # Checking response code for success

    videos = JSON.parse(response.body)['results']
    youtube_trailers = extract_official_youtube_trailers(videos)
    return nil if youtube_trailers.empty?
    youtube_trailers = clean_and_uniq_videos(youtube_trailers)
    youtube_trailers.each { |trailer| trailer['backdrop_path'] = backdrop_path }
  end

  # Extracts official YouTube trailers from a list of videos
  def self.extract_official_youtube_trailers(videos)
    official_youtube_videos =
      videos.filter_map do |video|
        video if video['site'] == 'YouTube' && video['type'] == 'Trailer' && video['official']
      end
  end

  def self.clean_and_uniq_videos(trailers)
    trailers.reject(&:empty?)
  end

  # Retrieves the API key from environment variables
  def self.api_key
    ENV.fetch('THEMOVIEDB_API_KEY', '')
  end
end
