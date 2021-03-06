class Planet < ActiveRecord::Base

  has_and_belongs_to_many :films
  has_many :characters
  has_many :specie, through: :characters
  self.primary_key = 'id'

end
