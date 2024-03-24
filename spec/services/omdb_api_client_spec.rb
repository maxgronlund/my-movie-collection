# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

# This is a simple example of a service test that uses WebMock to stub the HTTP request to the OMDB API.
RSpec.describe OmdbApiClient do
  describe '.fetch_movie_by_form_inputs' do
    let(:title) { 'Twister' }
    let(:api_key) { 'your_api_key' }
    let(:plot) { 'full' }
    let(:omdb_response_path) { Rails.root.join('spec', 'support', 'fixtures', 'omdb_response.json') }
    let(:mock_response) { File.read(omdb_response_path) }

    before do
      stub_request(:get, "http://www.omdbapi.com/?apikey=#{api_key}&plot=#{plot}&t=#{CGI.escape(title)}")
        .to_return(status: 200, body: mock_response)

      allow(ENV).to receive(:[]).with('OMDB_API_KEY').and_return(api_key)
    end

    it 'fetches movie information by title and plot' do
      response = OmdbApiClient.fetch_movie_by_form_inputs(title:, plot:)
      # response = JSON.parse(json_payload)

      expect(response['Title']).to eq('Twister')
      expect(response['Year']).to eq('1996')
    end
  end
end
