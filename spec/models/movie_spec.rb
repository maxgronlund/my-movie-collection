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
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
