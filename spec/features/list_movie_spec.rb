# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show Movie', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:movies) { FactoryBot.create_list(:movie, 5, user:) }

  scenario 'User show a movie' do
    visit new_user_session_path
    sign_in(user)
    click_link('My Movies')
    movie = movies.first
    find("#show_movie_#{movie.id}").click
    expect(page).to have_content(movie.Title)
    expect(page).to have_content(movie.Director)
    expect(page).to have_content(movie.Actors)
    expect(Movie.count).to eq(5)

    click_link('My Movies')
    find("#edit_movie_#{movie.id}").click
    expect(page).to have_content('Edit movie')
  end
end
