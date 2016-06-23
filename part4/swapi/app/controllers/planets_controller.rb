class PlanetsController < ApplicationController

  def index
    @planets = Planet.order("name")
  end

  def show
    @planet = Planet.find(params[:id])
  end

end
