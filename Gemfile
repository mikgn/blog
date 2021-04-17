source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-facebook', '5.0.0'

gem 'pg_search'

gem 'newrelic_rpm'
gem 'carrierwave', '~> 2.0'
gem "mini_magick"
gem 'rails', '~> 5.1.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'devise'
gem 'slim'
gem 'bootstrap', '~> 5.0.0.alpha1'
gem 'jquery-rails'
gem 'will_paginate', '~> 3.1.0'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

group :development do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
