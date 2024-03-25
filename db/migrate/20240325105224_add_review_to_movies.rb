# frozen_string_literal: true

class AddReviewToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :review, :text
  end
end
