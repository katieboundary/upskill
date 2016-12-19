# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/json"
require "sinatra/reloader" if development?

require 'erb'
require 'bcrypt'
require 'yaml'
require 'unsplash'
  require 'pry'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

YAML_CONFIG =
  if File.exists?('config/development.yml')
    YAML.load_file('config/development.yml')
  else
    {}
  end
# variable for local     runs locally                               variable for heroku
GOOGLE_API_YOUTUBE_KEY = YAML_CONFIG['GOOGLE_API_YOUTUBE_KEY'] || ENV['GOOGLE_API_YOUTUBE_KEY']
UNSPLASH_SECRET = YAML_CONFIG['UNSPLASH_SECRET'] || ENV['UNSPLASH_SECRET']
UNSPLASH_APPLICATION_ID = YAML_CONFIG['UNSPLASH_APPLICATION_ID'] || ENV['UNSPLASH_APPLICATION_ID']

Unsplash.configure do |config|
  config.application_id     = UNSPLASH_APPLICATION_ID
  config.application_secret = UNSPLASH_SECRET
  config.application_redirect_uri = "https://upskilling.herokuapp.com/"
end


# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'clients', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
