# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies/index', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:movies) { FactoryBot.create_list(:movie, 5, user:) }
  before(:each) do
    assign(:movies, movies)
    assign(:user, user)
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'renders a list of movies' do
    render
    expect(rendered).to match(/Create movie/)
    movies.each do |movie|
      expect(rendered).to match movie.Title
    end

    expect(rendered.scan(%r{Show</a>}).count).to eq(movies.count)
    expect(rendered.scan(%r{Edit</a>}).count).to eq(movies.count)
    expect(rendered.scan(%r{Destroy</button>}).count).to eq(movies.count)
  end
end
