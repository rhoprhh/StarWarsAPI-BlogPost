class Character < ActiveRecord::Base

  has_and_belongs_to_many :films
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :specie
  belongs_to :planet

end
