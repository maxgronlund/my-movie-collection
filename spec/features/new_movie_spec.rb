# frozen_string_literal: true

# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'New Movie', type: :feature do
  describe 'User log in with valid data' do
    let(:user) { create(:user) }
    let(:api_key) { ENV.fetch('OMDB_API_KEY', nil) }
    let(:omdb_response_path) { Rails.root.join('spec', 'support', 'fixtures', 'omdb_response.json') }
    let(:mock_response) { File.read(omdb_response_path) }

    before do
      stub_request(:get, "http://www.omdbapi.com/?apikey=#{api_key}&plot=short&t=20Matrix")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: File.read(omdb_response_path), headers: {})
    end

    it 'is created successful' do
      sign_in(user)
      visit new_user_movie_url(user)

      fill_in 'Title', with: '20Matrix'
      click_button 'Save'

      movie = Movie.last

      expect(page).to have_content(movie.Title)
      expect(page).to have_content(movie.Director)
      expect(page).to have_content(movie.Writer)
      expect(page).to have_content(movie.Actors)
    end
  end
end
