class CharacterSpecie < ActiveRecord::Base
  belongs_to :specie
  belongs_to :character
end
