require_relative '../config/environment.rb'


require 'pry'
x = ApiCommunicator.new





x.pull_characters
x.pull_films
x.pull_species
x.pull_vehicles
x.pull_starships
x.pull_planets
x.pull_characters_relations
x.pull_films_relations

# lengths = [fi.count, pe.count, sp.count, ve.count, st.count, pl.count]
#
# array = []
#
# pe.each do |x|
#   new_character = Character.new(
#     name: x["name"],
#     height: x["height"],
#     mass: x["mass"],
#     hair_color: x["hair_color"],
#     skin_color: x["skin_color"],
#     eye_color: x["eye_color"],
#     birth_year: x["birth_year"],
#     gender: x["gender"],
#     created: x["created"],
#     edited: x["edited"],
#     url: x["url"])
# end
