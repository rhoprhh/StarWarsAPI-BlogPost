require_relative '../config/environment.rb'


require 'pry'

def do_all_the_things
  x = ApiCommunicator.new
  x.pull_characters
  x.pull_films
  x.pull_species
  x.pull_vehicles
  x.pull_starships
  x.pull_planets
  x.pull_characters_relations
  x.pull_films_relations
end

do_all_the_things
