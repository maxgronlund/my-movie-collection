# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    let(:user) { FactoryBot.create(:user) }

    it 'returns http success' do
      sign_in user
      get user_path(user)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    let(:users) { create_list(:user, 10) }
    let(:user) { create(:user) }

    it 'returns http success' do
      sign_in user
      get users_path

      expect(response).to have_http_status(:success)
    end
  end
end
