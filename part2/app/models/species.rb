class Specie < ActiveRecord::Base

  has_many :characters
  has_many :films
  has_many :planets, through: :characters

end
