# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
