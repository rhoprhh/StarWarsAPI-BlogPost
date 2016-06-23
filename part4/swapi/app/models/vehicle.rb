class Vehicle < ActiveRecord::Base

  has_many :character_vehicles
  has_many :characters, through: :character_vehicles
  has_many :film_vehicles
  has_many :films, through: :film_vehicles
  self.primary_key = 'id'

end
