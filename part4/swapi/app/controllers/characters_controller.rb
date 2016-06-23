class CharactersController < ApplicationController

  def index
    @characters = Character.order("name")
  end
  def show
    @character = Character.find(params[:id])
  end
end
