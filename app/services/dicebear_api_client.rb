# frozen_string_literal: true

module DicebearApiClient
  require 'httparty'
  require 'fileutils'
  include HTTParty
  AVATARS_DIR = Rails.root.join('public', 'assets', 'avatars')
  FileUtils.mkdir_p(AVATARS_DIR)

  ADVENTURES = %w[
    Felix
    Fluffy
    Ginger
    Gracie
    Leo
    Mia
    George
    Lola
    Midnight
    Molly
    Pepper
    Abby
    Angel
    Cuddles
    Buddy
    Princess
    Oreo
    Milo
    Simon
    Chester
    Harley
    Tinkerbell
    Bella
    Jasper
    Salem
    Buster
    Cookie
    Sammy
    Smokey
    Snickers
    Luna
    Pumpkin
    Oscar
  ].freeze

  def self.fetch_avatar(user, _style = 'adventurer')
    avatar = ADVENTURES.sample
    response = get("https://api.dicebear.com/8.x/adventurer/svg?seed=#{avatar}")
    save_avatar(user, response.parsed_response)
  end

  def self.save_avatar(user, svg_content)
    filename = "avatar-#{user.id}.svg"
    filepath = Rails.root.join('public', 'assets', 'avatars', filename)

    # Ensure the svg_content is treated as UTF-8
    svg_content.force_encoding('UTF-8')

    File.write(filepath, svg_content)

    # Update the user's avatar URL assuming `public/assets/avatars/` is served under `/assets/avatars/`
    user.update(avatar: "/assets/avatars/#{filename}")
  rescue Encoding::UndefinedConversionError => e
    puts "Error: #{e}"
  end
end
