source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'wirble'
gem 'hirb'
gem 'squeel'


group :test, :development do
	gem 'sqlite3'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rails-erd'
end

group :production do
	gem 'pg', '~> 0.14.1'
end


group :test do
  gem 'shoulda'
  gem "rspec", "~> 2.13.0"
  gem 'cucumber-rails', :require => false
   # database_cleaner is not required, but highly recommended
   gem 'database_cleaner'
end
# Authentication

gem 'devise'
gem 'cancan'
gem 'rolify'

gem 'populator'
gem 'faker'

gem 'paperclip'
gem 'simple_form'
gem 'nested_form'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

#User Auth
#gem 'devise'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
