require 'bundler'
require 'sqlite3'
require 'active_record'
require 'pry'
require 'rest-client'
require_relative '../app/models/characters.rb'
require_relative '../app/models/films.rb'
require_relative '../app/models/planets.rb'
require_relative '../app/models/species.rb'
require_relative '../app/models/starships.rb'
require_relative '../app/models/vehicles.rb'
require_relative '../app/models/apicommunicator.rb'

#Dir["./app/models/*.rb"].each {|file| require file }

connection_details = {
  :adapter => "sqlite3",
  :database => "../db/starwars.db"}

ActiveRecord::Base.establish_connection(connection_details)
