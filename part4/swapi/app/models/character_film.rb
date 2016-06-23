class CharacterFilm < ActiveRecord::Base
  belongs_to :film
  belongs_to :character
end
