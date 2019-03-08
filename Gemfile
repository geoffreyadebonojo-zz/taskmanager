source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'autocomplete-off'
gem 'fast_jsonapi'
gem 'figaro'
gem 'rack-cors'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'factory_bot_rails'
gem 'faker'

gem 'mechanize'
gem 'graphql'

group :development, :test do
  gem 'rb-readline'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'graphiql-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development