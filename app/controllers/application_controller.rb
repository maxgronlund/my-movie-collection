# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  # method to redirect to the user show page after login
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
