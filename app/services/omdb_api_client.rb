# frozen_string_literal: true

require 'httparty'

module OmdbApiClient
  include HTTParty

  base_uri 'http://www.omdbapi.com/'

  def self.fetch_movie_by_form_inputs(title:, plot: 'short')
    api_key = ENV.fetch('OMDB_API_KEY', nil)
    options = { query: { t: title, plot:, apikey: api_key } }

    response = get('/', options)
    response.parsed_response.is_a?(String) ? JSON.parse(response.parsed_response) : response.parsed_response
  end
end
