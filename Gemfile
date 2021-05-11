source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 5.0.0.alpha1'
gem 'carrierwave', '~> 2.0'
gem 'devise'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'jquery-rails'
gem 'mini_magick'
gem 'newrelic_rpm'
gem 'omniauth-facebook', '5.0.0'
gem 'omniauth-oauth2', '1.3.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.7'
gem 'sass-rails', '~> 5.0'
gem 'slim'
gem 'will_paginate', '~> 3.1.0'

group :development do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
