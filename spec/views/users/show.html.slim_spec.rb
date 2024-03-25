# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show.html.slim', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:movies) { FactoryBot.create_list(:movie, 5, user:) }
  before(:each) do
    assign(:movies, movies)
    assign(:user, user)
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'renders the users show page' do
    render
    expect(rendered).to include(user.username)
  end
end
