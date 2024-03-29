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
class YoutubeTrailer < ApplicationRecord
  belongs_to :movie
end
