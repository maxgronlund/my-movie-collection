# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MoviesHelper. For example:
#
# describe MoviesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe MoviesHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie, user:, Year: '2020', Genre: 'Action') }
  describe '#movie_info' do
    it 'returns movie year and genre' do
      expect(helper.movie_info(movie)).to eq('2020 - Action')
    end
  end

  describe '#star_rating' do
    # Example assuming `star_rating` method exists in the helper module `YourHelperModuleName`

    it 'returns the correct HTML for a full 6-star rating' do
      expect(helper.star_rating(10, 6)).to eq('<i class="fas text-warning fa-star"></i>' * 6)
    end

    it 'returns the correct HTML for a 3-star rating' do
      rating = 5
      expected = ('<i class="fas text-warning fa-star"></i>' * 3) + ('<i class="far fa-star"></i>' * 3)
      expect(helper.star_rating(rating)).to eq(expected)
    end

    it 'returns the correct HTML for a 1-star rating with empty stars' do
      rating = 10.0 / 6.0
      expected = "<i class=\"fas text-warning fa-star\"></i>#{'<i class="far fa-star"></i>' * 5}"
      expect(helper.star_rating(rating)).to eq(expected)
    end

    it 'returns the correct HTML for a 4.5-star rating with empty stars' do
      rating = (10.0 / 6.0) * 4.5
      expected =
        "#{'<i class="fas text-warning fa-star"></i>' * 4}<i class=\"fas text-warning fa-star-half-alt\"></i><i class=\"far fa-star\"></i>"
      expect(helper.star_rating(rating)).to eq(expected)
    end

    it 'handles a zero rating' do
      expect(helper.star_rating(0)).to eq('<i class="far fa-star"></i>' * 6)
    end

    it 'handles a maximum rating' do
      expect(helper.star_rating(10)).to eq('<i class="fas text-warning fa-star"></i>' * 6)
    end
  end
end
