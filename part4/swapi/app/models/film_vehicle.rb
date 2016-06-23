class FilmVehicle < ActiveRecord::Base
  belongs_to :film
  belongs_to :vehicle
end
