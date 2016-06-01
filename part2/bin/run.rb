require_relative '../config/environment.rb'


require 'pry'

def do_all_the_things
  x = ApiCommunicator.new
  x.pull_characters
  puts "all CHARACTERS successfully pulled"
  x.pull_films
  puts "all FILMS successfully pulled"
  x.pull_species
  puts "all SPECIES successfully pulled"
  x.pull_vehicles
  puts "all VEHICLES successfully pulled"
  x.pull_starships
  puts "all STARSHIPS successfully pulled"
  x.pull_planets
  puts "all PLANETS successfully pulled"
  x.pull_characters_relations
  puts "all CHARACTERS successfully RELATED"
  x.pull_films_relations
  puts "all FILMS successfully REALTED"
end

do_all_the_things
