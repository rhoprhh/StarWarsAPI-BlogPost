class Starship < ActiveRecord::Base

  has_many :character_starships
  has_many :characters, through: :character_starships
  has_many :film_starships
  has_many :films, through: :film_starships
  self.primary_key = 'id'

end
