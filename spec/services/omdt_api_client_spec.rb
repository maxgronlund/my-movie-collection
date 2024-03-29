# require 'rails_helper'
# require 'webmock/rspec'
# require 'omdt_api_client'

# RSpec.describe OmdtApiClient do
#   describe '.add_youtube_trailers' do
#     let(:movie) { double('Movie', Title: 'The Empire Strikes Back', youtube_trailers: trailers_relation) }
#     let(:trailers_relation) { double('ActiveRecord::Relation') }

#     before do
#       # allow(ENV).to receive(:fetch).with('THEMOVIEDB_API_KEY', '').and_return('your_api_key')
#       # stub_request(:get, /api.themoviedb.org/3\/search\/movie/).to_return(body: search_response.to_json, status: 200)
#       # stub_request(:get, /api.themoviedb.org/3\/movie\/\d+\/videos/).to_return(body: videos_response.to_json, status: 200)
#       # allow(trailers_relation).to receive(:exists?).and_return(false)
#       # allow(trailers_relation).to receive(:build)
#       # allow(movie).to receive(:save)
#     end

#     let(:search_response) {
#       {
#         "results" => [
#           { "id" => 1, "backdrop_path" => "/path/to/backdrop.jpg" }
#         ]
#       }
#     }

#     let(:videos_response) {
#       {
#         "results" => [
#           { "name" => "Trailer 1", "key" => "abc123", "site" => "YouTube", "type" => "Trailer", "official" => true }
#         ]
#       }
#     }

#     it 'adds youtube trailers to the movie' do
#       expect(trailers_relation).to receive(:build).with(hash_including(name: "Trailer 1", key: "abc123"))
#       expect(movie).to receive(:save)

#       described_class.add_youtube_trailers(movie)
#     end

#     context 'when API key is missing' do
#       before { allow(ENV).to receive(:fetch).with('THEMOVIEDB_API_KEY', '').and_return('') }

#       it 'does not add trailers' do
#         expect(trailers_relation).not_to receive(:build)
#         described_class.add_youtube_trailers(movie)
#       end
#     end

#     # More tests for different scenarios...
#   end

#   # Additional tests for .youtube_trailers_attributes, .by_title, etc.
# end
