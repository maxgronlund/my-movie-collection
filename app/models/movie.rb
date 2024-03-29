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
class Movie < ApplicationRecord
  belongs_to :user
  has_many :youtube_trailers
  accepts_nested_attributes_for :youtube_trailers

  validates :Title, presence: true

end
