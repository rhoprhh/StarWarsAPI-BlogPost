class HomeController < ApplicationController
  def index
    @characters = Character.all
    @films = Film.all
    @species = Specie.all
    @starships = Starship.all
    @vehicles = Vehicle.all
    @planets = Planet.all
  end
end
