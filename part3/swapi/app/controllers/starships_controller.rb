class StarshipsController < ApplicationController

  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
  end

end
