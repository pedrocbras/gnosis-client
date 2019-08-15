source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', require: 'rack/cors'
gem 'faker'
gem 'active_model_serializers'


group :development, :test do
 gem 'coveralls', require: false
 gem 'pry-rails'
 gem 'pry-byebug'
 gem 'rspec-rails'
 gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
 gem 'factory_bot_rails' 
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
