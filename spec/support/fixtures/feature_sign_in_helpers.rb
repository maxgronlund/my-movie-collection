# frozen_string_literal: true

module FeatureSignInHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123' # Assuming the password is known and consistent
    click_button 'Log in'
  end
end
