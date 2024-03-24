# frozen_string_literal: true

module MoviesHelper
  def movie_info(movie)
    "#{movie.Year} - #{movie.Genre}"
  end

  def star_rating(rating)
    total_stars = 6
    full_star = (rating / 2).floor
    half_star = rating % 2 >= 0.5 ? 1 : 0
    empty_star = total_stars - full_star - half_star

    stars_html = ''
    full_star.times { stars_html += content_tag(:i, '', class: 'fas text-warning fa-star') }
    half_star.times { stars_html += content_tag(:i, '', class: 'fas text-warning fa-star-half-alt') }
    empty_star.times { stars_html += content_tag(:i, '', class: 'far fa-star') }
    stars_html.html_safe
  end
end
