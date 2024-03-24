# frozen_string_literal: true

json.extract! movie, :id, :user_id, :Title, :Year, :Rated, :Released, :Runtime, :Genre, :Director, :Writer, :Actors,
              :Plot, :Language, :Country, :Awards, :Poster, :Metascore, :imdbRating, :imdbVotes, :imdbID, :Type, :DVD, :BoxOffice, :Production, :Website, :created_at, :updated_at
json.url movie_url(movie, format: :json)
