source 'https://rubygems.org'

# OSX is darwin
def darwin_only(require_as)
  RUBY_PLATFORM.include?('darwin') && require_as
end

def linux_only(require_as)
  RUBY_PLATFORM.include?('linux') && require_as
end

gem 'rails', '~> 4.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'bootstrap-sass'
	gem 'sass-rails', '~> 4.0.0'
	gem 'coffee-rails', '~> 4.0.0'

	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
	gem 'therubyracer', :platform => :ruby
	gem 'libv8'
	gem 'jquery-datatables-rails'
	gem 'font-awesome-sass-rails'

	gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem "capybara"
  gem "launchy"
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'nifty-generators'
  gem 'bcrypt-ruby', :require => 'bcrypt'
  gem 'faker'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'spork'
  #gem 'rb-inotify'
end

group :production do
  gem 'mysql2'
end

gem 'bcrypt-ruby'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'simple_form'
gem 'chosen-rails'
gem 'ckeditor'
gem 'mini_magick'

gem 'simplecov'

# Notification
gem 'rb-fsevent', require: darwin_only('rb-fsevent')
#gem 'growl',      require: darwin_only('growl')
gem 'rb-inotify', require: linux_only('rb-inotify')

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "mocha", :group => :test
