class Film < ActiveRecord::Base

  has_and_belongs_to_many :planets
  has_and_belongs_to_many :specie
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :characters
  self.primary_key = 'id'


end
