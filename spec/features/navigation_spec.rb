# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User navigates to', type: :feature do
  scenario 'the home page and clicks a button' do
    visit root_path
    click_on 'Create account'

    expect(page).to have_text('Create account')
    expect(page).to have_text('Password(6 characters minimum)')
  end
end
