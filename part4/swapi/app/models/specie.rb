class Specie < ActiveRecord::Base

  has_many :character_species
  has_many :characters, through: :character_species
  has_many :planets, through: :characters
  self.primary_key = 'id'

end
