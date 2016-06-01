class CharacterStarship < ActiveRecord::Base
  belongs_to :starship
  belongs_to :character
end
