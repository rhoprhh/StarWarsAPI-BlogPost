class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.order("name")
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

end
