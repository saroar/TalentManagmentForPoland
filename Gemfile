source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core Gem
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#
gem 'slim-rails', '~> 3.1', '>= 3.1.3'
gem 'devise', '~> 4.3'
gem 'cancancan', '~> 2.0'
gem 'rolify', '~> 5.1'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem 'activeadmin', github: 'activeadmin'
gem 'jquery-ui-rails'
gem 'just-datetime-picker'
gem 'wicked_pdf'
gem 'wkhtmltopdf-heroku'

# Images
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'fog-aws'

group :development, :test do
  gem 'figaro'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'pry'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
