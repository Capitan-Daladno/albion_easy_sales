source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.3'

gem 'devise'
gem 'devise-i18n'

gem 'twitter-bootstrap-rails'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'rubocop-rails', require: false

# gems for_heroku

gem 'rails_12factor'
gem 'uglifier', '~> 2.7', '>= 2.7.2'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
end
