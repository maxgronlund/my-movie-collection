# == Schema Information
#
# Table name: youtube_trailers
#
#  id            :bigint           not null, primary key
#  name          :string
#  key           :string
#  backdrop_path :string
#  movie_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :youtube_trailer do
    name { Faker::Movie.title }
    key { "MyString" }
    backdrop_path { "some_youtube_key" }
    association :movie
  end
end
