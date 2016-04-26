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
# require_relative '../data/raw_arrays/characters_array.rb'
# require_relative '../data/raw_arrays/films_array.rb'
# require_relative '../data/raw_arrays/planets_array.rb'
# require_relative '../data/raw_arrays/species_array.rb'
# require_relative '../data/raw_arrays/starships_array.rb'
# require_relative '../data/raw_arrays/vehicles_array.rb'

#Dir["./app/models/*.rb"].each {|file| require file }

connection_details = {
  :adapter => "sqlite3",
  :database => "../db/starwars.db"}

ActiveRecord::Base.establish_connection(connection_details)
