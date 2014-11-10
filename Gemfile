source 'https://rubygems.org'

# OSX is darwin
def darwin_only(require_as)
	RUBY_PLATFORM.include?('darwin') && require_as
end

def linux_only(require_as)
	RUBY_PLATFORM.include?('linux') && require_as
end

gem 'rails', '4.1.7'

gem 'sqlite3'


gem 'bootstrap-sass'
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails'

gem 'therubyracer', platform: :ruby
gem 'jquery-datatables-rails'
gem 'font-awesome-sass'

gem 'uglifier'
gem 'haml'

group :development, :test do
	gem "capybara"
	gem "launchy"
	gem 'rspec'
	gem 'rspec-rails'
	gem 'shoulda'
	gem 'shoulda-matchers'
	gem 'factory_girl_rails'
	gem 'nifty-generators'
	gem 'faker'
	gem 'simplecov'
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
gem 'chosen-rails', git: 'https://github.com/angryzor/chosen-rails.git'
gem 'ckeditor'
gem 'mini_magick'
gem 'tilt'
gem 'markdown'
