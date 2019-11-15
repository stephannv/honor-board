source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'awesome_print', '1.8.0'
gem 'bootsnap', '1.4.4', require: false
gem 'grape', '1.2.3'
gem 'grape-entity', '0.7.1'
gem 'pg', '1.1.4'
gem 'puma', '3.12.1'
gem 'rack-cors', '1.0.5'
gem 'rails', '6.0.0.rc1'
gem 'scenic', '1.5.1'
gem 'seedbank', '0.5.0'
gem 'simple_enum', '2.3.2'
gem 'tzinfo-data', '1.2.5', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '5.0.2'
  gem 'faker', '1.9.3'
  gem 'rspec-rails', '3.8.2'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rubocop', '0.69.0'
  gem 'rubocop-performance', '1.3.0'
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'shoulda-matchers', '4.0.1'
  gem 'simplecov', '0.16.1', require: false
end
