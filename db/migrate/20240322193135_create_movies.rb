# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :Title
      t.string :Year
      t.string :Rated
      t.string :Released
      t.string :Runtime
      t.string :Genre
      t.string :Director
      t.text :Writer
      t.text :Actors
      t.text :Plot
      t.string :Language
      t.string :Country
      t.text :Awards
      t.string :Poster
      t.string :Metascore
      t.string :imdbRating
      t.string :imdbVotes
      t.string :imdbID
      t.string :Type
      t.string :DVD
      t.string :BoxOffice
      t.string :Production
      t.string :Website

      t.timestamps
    end
  end
end
