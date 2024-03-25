# frozen_string_literal: true

module MoviesHelper
  def movie_info(movie)
    "#{movie.Year} - #{movie.Genre}"
  end

  # receives a rating in the range 0-10 and returns the corresponding HTML for the stars
  def star_rating(rating, max_stars = 6)
    rating_in_half_stars = rating * max_stars * 0.2
    rating_in_full_stars = rating_in_half_stars * 0.5

    full_stars = rating_in_full_stars.floor.to_i
    half_star = rating_in_full_stars - full_stars >= 0.5 ? 1 : 0
    empty_stars = max_stars - full_stars - half_star

    stars_html = ''
    full_stars.times { stars_html += content_tag(:i, '', class: 'fas text-warning fa-star') }
    half_star.times { stars_html += content_tag(:i, '', class: 'fas text-warning fa-star-half-alt') }
    empty_stars.times { stars_html += content_tag(:i, '', class: 'far fa-star') }
    stars_html.html_safe
  end
end
