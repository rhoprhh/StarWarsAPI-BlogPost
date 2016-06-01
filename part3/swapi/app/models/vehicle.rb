class Vehicle < ActiveRecord::Base

  has_and_belongs_to_many :characters
  has_and_belongs_to_many :films
  self.primary_key = 'id'

end
