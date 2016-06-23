class SpeciesController < ApplicationController

  def index
    @species = Specie.order("name")
  end

  def show
    @specie = Specie.find(params[:id])
  end

end
