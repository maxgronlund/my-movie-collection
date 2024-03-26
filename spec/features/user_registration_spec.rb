# frozen_string_literal: true

# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'UserRegistration', type: :feature do
  describe 'User signs up with valid data' do
    before do
      stub_request(:get, 'https://api.dicebear.com/8.x/adventurer/svg?seed=Cookie')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: '', headers: {})
    end

    it 'is successful' do
      visit new_user_registration_path

      fill_in 'Username', with: 'newuser'
      fill_in 'Email', with: 'newuser@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'

      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end
