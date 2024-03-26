# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  Title      :string
#  Year       :string
#  Rated      :string
#  Released   :string
#  Runtime    :string
#  Genre      :string
#  Director   :string
#  Writer     :text
#  Actors     :text
#  Plot       :text
#  Language   :string
#  Country    :string
#  Awards     :text
#  Poster     :string
#  Metascore  :string
#  imdbRating :string
#  imdbVotes  :string
#  imdbID     :string
#  Type       :string
#  DVD        :string
#  BoxOffice  :string
#  Production :string
#  Website    :string
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :movie do
    association :user
    Title { Faker::Movie.title }
    Year { Faker::Number.number(digits: 4) }
    Rated { "Rating - #{Faker::Number.number(digits: 1)}" }
    Released { Faker::Number.number(digits: 4) }
    Runtime { 'MyString' }
    Genre { 'MyString' }
    Director { 'MyString' }
    Writer { 'MyText' }
    Actors { 'MyText' }
    Plot { 'MyText' }
    Language { 'MyString' }
    Country { 'MyString' }
    Awards { 'MyText' }
    Poster { 'MyString' }
    Metascore { 'MyString' }
    imdbRating { 'MyString' }
    imdbVotes { 'MyString' }
    imdbID { 'MyString' }
    Type { 'MyString' }
    DVD { 'MyString' }
    BoxOffice { 'MyString' }
    Production { 'MyString' }
    Website { 'MyString' }
  end
end
