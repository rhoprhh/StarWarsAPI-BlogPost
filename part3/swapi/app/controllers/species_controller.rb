class SpeciesController < ApplicationController

  def index
    @species = Specie.all
  end

  def show
    @specie = Specie.find(params[:id])
  end

end
