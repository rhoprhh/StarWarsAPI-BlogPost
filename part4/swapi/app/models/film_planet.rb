class FilmPlanet < ActiveRecord::Base
  belongs_to :film
  belongs_to :planet
end
