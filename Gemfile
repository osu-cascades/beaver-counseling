source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'chartkick'
gem 'bootstrap'
#gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'devise'
gem 'devise_security_extension', git: 'https://github.com/phatworx/devise_security_extension.git'
gem 'high_voltage', '~> 3.0.0'
gem 'ckeditor'
gem "paperclip", "~> 5.2.1"
gem 'paper_trail'
gem 'diffy'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'listen', '>= 3.0.5', '< 3.2'
gem "appengine", "~> 0.4.1"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
