# README


This is the solution for a code challenge by Træls.<br/> 
There are more features and styling than required..
I had a fun time and liked to practice my skills, so please forgive me for doing stuff I was not asked to do.

### Prerequisites
- Ruby 3.2
- Rails 7
- Postgresql
- Google Chrome

Nice to Have
- direnv, for environment Variables
- asdf, for version management

### Configuration
Environment variables
```
export OMDB_API_KEY="xxxxxxxxxx"
```

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
Be patient, the seed might tage a little while to complete.
### Test

How to run the test suite
```
$ bundle exec rspec .
```
- The project is using webmock for some of the tests.
- For test coverage look at the `/coverage/index.html` file


### Acknowledgement
- Avatars are fetched from [dicebear](https://www.dicebear.com/styles/adventurer/)

### Notes
- DB fields with uppercase names are due to a one-to-one relation between omdb payloads and the movie model.
