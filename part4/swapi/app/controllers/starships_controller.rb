class StarshipsController < ApplicationController

  def index
    @starships = Starship.order("name")
  end

  def show
    @starship = Starship.find(params[:id])
  end

end
