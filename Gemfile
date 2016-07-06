source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'mysql2'

# Use mysql as the database for Active Record
group :development, :test do

  # Testing 
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'database_rewinder', '~> 0.5.3'
  gem 'rspec-request_describer', '~>0.0.9'
  gem 'autodoc', '~> 0.5.1'
  gem 'json_spec', '~> 1.1.4'
  gem 'shoulda-matchers', '~>2.8.0'
end

group :production do
  gem 'thin'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
end

# API framework
gem 'grape'
gem 'grape-jbuilder'

# Admin GUI
gem 'devise'
gem 'kaminari'
gem 'bootstrap-sass', '2.3.2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
