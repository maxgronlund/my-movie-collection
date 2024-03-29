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
require 'rails_helper'

RSpec.describe YoutubeTrailer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:movie) }
  end
end
