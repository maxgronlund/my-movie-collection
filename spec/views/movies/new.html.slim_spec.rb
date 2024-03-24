# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies/new', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie, user:) }
  before(:each) do
    assign(:movie, movie)
    assign(:user, user)
  end

  it 'renders the edit movie form' do
    render
    # Adjust the expected_path to use user_movie_path for nested resource
    expected_path = user_movie_path(user, movie)
    assert_select 'form[action=?][method=?]', expected_path, 'post' do
      # Ensure a hidden input for `_method` with value `patch` exists
      assert_select 'input[name=_method][value=patch]', count: 1
      # Check for the input field with name `movie[Title]`
      assert_select 'input[name=?]', 'movie[Title]'
    end
  end
end
