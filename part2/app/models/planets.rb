class Planet < ActiveRecord::Base

  has_many :films
  has_many :characters
  has_many :species, through: :people
  
end
