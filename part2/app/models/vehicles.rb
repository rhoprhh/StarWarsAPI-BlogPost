class Vehicle < ActiveRecord::Base

  has_and_belongs_to_many :characters
  has_and_belongs_to_many :films

end
