class Film < ActiveRecord::Base

  has_many :planets
  has_many :species
  has_many :vehicles
  has_many :starships
  has_many :characters

end
