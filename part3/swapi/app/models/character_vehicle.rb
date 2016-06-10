class CharacterVehicle < ActiveRecord::Base
  belongs_to :character
  belongs_to :vehicle
end
