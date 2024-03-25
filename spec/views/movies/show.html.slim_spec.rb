# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies/show', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie, user:) }
  before(:each) do
    assign(:movie, movie)
    assign(:user, user)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(movie.Title)
    expect(rendered).to match(movie.Actors)
    expect(rendered).to match(movie.Director)
  end
end
