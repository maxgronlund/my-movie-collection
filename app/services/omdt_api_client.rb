# frozen_string_literal: true

module OmdtApiClient
  require 'httparty'
  include HTTParty
  def self.fetch_movie(_id)
    # https://api.themoviedb.org/3/movie/762/videos?api_key=a85ed02d93ffe649195bedfffe014b20
    videos_response = HTTParty.get("https://api.themoviedb.org/3/movie/#{movie_id}/videos", {
                                     query: {
                                       api_key:
                                     }
                                   })

    # Filter for the trailer video type
    trailer = videos_response['results'].find { |video| video['type'] == 'Trailer' }

    trailer['key'] if trailer
  end

  base_uri 'http://www.omdbapi.com/'

  def self.fetch_movie_by_form_inputs(title:, plot: 'short')
    api_key = ENV['THEMOVIEDB_API_KEY']
    options = { query: { t: title, plot:, apikey: api_key } }

    response = get('/', options)

    # Ensure to handle errors and check response code
    response.parsed_response if response.success?
  end

  def self.api_key
    ENV['OMDB_API_KEY']
  end
end
