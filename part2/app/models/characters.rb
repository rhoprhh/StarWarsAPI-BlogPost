class Character < ActiveRecord::Base

  has_many :films
  has_many :starships
  has_many :vehicles
  belongs_to :specie
  belongs_to :planet

end
