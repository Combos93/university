source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'rails-i18n'
gem 'uglifier', '>= 1.3.0'

gem 'activeadmin'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails', branch: "4-0-maintenance"
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :development, :profile do
  gem 'annotate', require: false
  gem 'rubocop'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
