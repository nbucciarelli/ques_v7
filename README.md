#### To deploy to heroku

- Create Heroku account
- Install heroku toolbelt
- in config/application.rb:
  - config.assets.initialize_on_precompile = false
- in config/environments/production.rb
  - config.assets.compile = true
- in Gemfile:
  - gem 'pg', group: :production
  - gem 'mysql2', group: :development
- heroku create <name>
  - if you don't supply a name, heroku will supply one for you
- git push heroku master


### When you change code:

- git add -A
- git commit -am "Dudeman"
- git push origin master
- git push heroku master


### Mailers:

- to use letter_opener
  - https://github.com/ryanb/letter_opener

