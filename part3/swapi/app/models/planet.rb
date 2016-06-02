class Planet < ActiveRecord::Base

  has_many :film_planets
  has_many :films, through: :film_planets
  has_many :characters
  has_many :species, through: :characters
  self.primary_key = 'id'

end
