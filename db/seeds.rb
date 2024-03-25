# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Famous deceased rockstars
# Assuming OmdbApiClient is defined somewhere in your application
# and it can fetch movie details by title.

# Famous deceased rockstars
rockstar_names = [
  'Freddie Mercury',
  'Jimi Hendrix',
  'Janis Joplin',
  'Kurt Cobain',
  'John Lennon',
  'Jim Morrison',
  'Elvis Presley',
  'Amy Winehouse',
  'Bob Marley',
  'David Bowie'
]

# List of movies to create for each user
movie_titles = [
  'The Shawshank Redemption',
  'The Godfather',
  'The Dark Knight',
  "Schindler's List",
  'Pulp Fiction',
  'The Lord of the Rings: The Return of the King',
  'The Good, the Bad and the Ugly',
  'Fight Club',
  'Forrest Gump',
  'Inception',
  'Star Wars: Episode V - The Empire Strikes Back',
  'The Lord of the Rings: The Fellowship of the Ring',
  'The Matrix',
  'Goodfellas',
  'City of God',
  'Spirited Away',
  'The Silence of the Lambs',
  "It's a Wonderful Life",
  'Life Is Beautiful',
  'Parasite',
  'Interstellar',
  'Whiplash',
  'The Prestige',
  'The Departed',
  'The Pianist',
  'Gladiator',
  'American History X',
  'The Usual Suspects',
  'Psycho',
  'Léon: The Professional',
  'City Lights',
  'Grave of the Fireflies',
  'Casablanca',
  'The Lion King',
  'Avengers: Infinity War',
  'Rear Window',
  'Terminator 2: Judgment Day',
  'Back to the Future',
  'Modern Times',
  'Whispers of the Heart',
  'Alien',
  'Apocalypse Now',
  'Aliens',
  'Amélie',
  'Coco',
  'The Great Dictator',
  'Cinema Paradiso',
  'The Lives of Others',
  'Paths of Glory',
  'Django Unchained',
  'The Shining',
  'WALL-E',
  'American Beauty',
  'The Dark Knight Rises',
  'Princess Mononoke',
  'Blade Runner',
  'Oldboy',
  'Star Wars: A New Hope',
  'Mad Max: Fury Road',
  'Jurassic Park',
  'The Empire Strikes Back',
  'The Treasure of the Sierra Madre',
  'Raging Bull',
  'The Third Man',
  'The Sound of Music',
  'Amadeus',
  'A Clockwork Orange',
  'Taxi Driver',
  'La La Land',
  'Double Indemnity',
  'Braveheart',
  'To Kill a Mockingbird',
  'The Secret in Their Eyes',
  'The Green Mile',
  'Some Like It Hot',
  'A Separation',
  'Metropolis',
  'My Neighbor Totoro',
  'Rashomon',
  'The Seventh Seal',
  'The Bridge on the River Kwai',
  'Die Hard',
  'Batman Begins',
  'Hotel Rwanda',
  'The Wizard of Oz',
  'Dr. Strangelove',
  'The Graduate',
  "Pan's Labyrinth",
  'The Gold Rush',
  'The Intouchables',
  'Scarface',
  'The Social Network',
  'The Big Lebowski',
  'Monty Python and the Holy Grail',
  'Eternal Sunshine of the Spotless Mind',
  'Return of the Jedi',
  "Singin' in the Rain",
  'North by Northwest'
]

rockstar_names.each_with_index do |name, index|
  # Generate a unique email for each rockstar
  email = index.zero? ? 'max@example.com' : "#{name.downcase.gsub(' ', '_')}@example.com"
  name = index.zero? ? 'Max Groenlund' : name

  # Check if the user already exists
  user = User.find_or_initialize_by(email:)

  if user.new_record?
    user.username = name
    user.password = 'password1234'
    user.password_confirmation = 'password1234'
    user.save!
  end

  # Determine the range of movie titles for the current user
  titles_range = (index * 10...index * 10 + 10)

  movie_titles[titles_range].each do |title|
    next if Movie.find_by(Title: title, user_id: user.id)

    # You may need to adjust the fetching method according to your actual implementation
    api_response = OmdbApiClient.fetch_movie_by_form_inputs(title:)
    next if api_response['Response'] == 'False'

    prepared_data = api_response.except('Ratings', 'Response')
    prepared_data['user_id'] = user.id

    # Check if the movie already exists
    movie = Movie.find_or_initialize_by(Title: prepared_data['Title'], user_id: user.id)
    if movie.new_record?
      movie.assign_attributes(prepared_data)
      movie.save!
    end
  end

  DicebearApiClient.fetch_avatar(user, 'adventurer') # if user.avatar.blank?
end
