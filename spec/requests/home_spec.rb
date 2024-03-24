# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get root_path
      expect(response).to render_template(:index)
    end
  end
end
