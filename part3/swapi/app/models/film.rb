class Film < ActiveRecord::Base
  has_many :film_planets
  has_many :planets, through: :film_planets
  has_many :film_species
  has_many :species, through: :film_species
  has_many :film_vehicles
  has_many :vehicles, through: :film_vehicles
  has_many :film_starships
  has_many :starships, through: :film_starships
  has_many :character_films
  has_many :characters, through: :character_films
  self.primary_key = 'id'

end
