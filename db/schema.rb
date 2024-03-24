# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_324_062_328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'movies', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'Title'
    t.string 'Year'
    t.string 'Rated'
    t.string 'Released'
    t.string 'Runtime'
    t.string 'Genre'
    t.string 'Director'
    t.text 'Writer'
    t.text 'Actors'
    t.text 'Plot'
    t.string 'Language'
    t.string 'Country'
    t.text 'Awards'
    t.string 'Poster'
    t.string 'Metascore'
    t.string 'imdbRating'
    t.string 'imdbVotes'
    t.string 'imdbID'
    t.string 'Type'
    t.string 'DVD'
    t.string 'BoxOffice'
    t.string 'Production'
    t.string 'Website'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_movies_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'movies', 'users'
end
