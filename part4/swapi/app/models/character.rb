class Character < ActiveRecord::Base
  has_many :character_films
  has_many :films, through: :character_films
  has_many :character_starships
  has_many :starships, through: :character_starships
  has_many :character_vehicles
  has_many :vehicles, through: :character_vehicles
  has_many :character_species
  has_many :species, through: :character_species
  belongs_to :planet
  self.primary_key = 'id'

end
