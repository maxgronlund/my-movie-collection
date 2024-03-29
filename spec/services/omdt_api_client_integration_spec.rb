# frozen_string_literal: true

require 'rails_helper'

# This is an integration test that makes a real HTTP request to the OMDB API.
RSpec.describe OmdbApiClient, :integration do
  describe '.add_youtube_trailers' do
    # let(:title) { 'Twister' }
    # let(:plot) { 'full' }
    # let(:api_key) { ENV.fetch('OMDB_API_KEY', nil) }
    let(:movie) {create(:movie, Title: 'Twister', Plot: 'full')}

    before do
      WebMock.allow_net_connect!
    end

    after do
      WebMock.disable_net_connect!(allow_localhost: false)
    end

    it 'fetches movie information by title and plot' do
      # ap movie
      # response = OmdbApiClient.fetch_movie_by_form_inputs(title:, plot:)
      # expect(response['Title']).to eq('Twister')
      # expect(response['Year']).to eq('1996')
    end
  end
end
