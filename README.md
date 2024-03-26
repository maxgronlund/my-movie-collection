# README


This is the solution for a code challenge by Træls.<br/> 
There is way more features and styling that required.
I just had a fun time, and like to **practicing** my skills, so please forgive me for doing stuff I was not asked to do.

### Prerequisites
- Ruby 3.2
- Rails 7
- Postgresql
- Google Chriome

Nice to have
- direnv, for environment variables
- asdf, for version management

### Configuration
Environment variables
```
export OMDB_API_KEY="xxxxxxxxxx"
export THEMOVIEDB_API_KEY="xxxxxxxxxx"
```
You can request api keys from me or get them for free at 

### Development<br/>
To add a comment summarizing the current schema to the top or bottom of each model
```
$ annotate --models
```
Code linter
```
$ rubocop
```

### Building assets
```
rails assets:precompile
```

### Database creation
```
$ rake db:create
```

### Database initialization
```
$ rake db:migrate
$ rake db:seed
```
### Test

How to run the test suite
```
$ bundle exec rspec .
```
- The project is using webmock for some of the tests.
- For test coverage look at the `/coverage/index.html` file


### Acknowledgement
- Avatars is fetched from [dicebear](https://www.dicebear.com/styles/adventurer/)

### Notes
- DB fields with uppercase names is due to a one to one relation between omdb payloads and the movie model.