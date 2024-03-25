# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies/edit', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie, user:, Title: 'Example Title', Year: '2020') }

  before(:each) do
    assign(:movie, movie)
    assign(:user, user)
  end

  it 'renders the edit movie form' do
    render

    expected_path = user_movie_path(user, movie)
    assert_select 'form[action=?][method=?]', expected_path, 'post' do
      assert_select 'input[name=_method][value=patch]', count: 1
      assert_select 'input[name=?]', 'movie[Title]'
    end
  end
end
