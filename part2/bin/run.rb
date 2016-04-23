require_relative '../config/environment.rb'


require 'pry'
x = ApiCommunicator.new
fi = x.pull_films
pe = x.pull_characters
sp = x.pull_species
ve = x.pull_vehicles
st = x.pull_starships
pl = x.pull_planets
lengths = [ fi.count, pe.count, sp.count, ve.count, st.count, pl.count]
binding.pry
