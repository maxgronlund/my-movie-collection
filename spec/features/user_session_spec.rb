# frozen_string_literal: true

# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'UserSession', type: :feature do
  describe 'User log in with valid data' do
    let(:user) { create(:user) }

    it 'is successful' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password123'
      click_button 'Log in'

      expect(page).to have_content("out\nSigned in successfully.")
    end
  end
end
