# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete Movie', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:movies) { FactoryBot.create_list(:movie, 5, user:, Title: "Some title") }

  scenario 'User deletes a movie' do
    visit new_user_session_path
    sign_in(user)
    click_link 'My Movies'
    find("#delete_movie_#{movies.first.id}").click
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Movie was successfully destroyed.')
    expect(Movie.count).to eq(4)
  end
end
