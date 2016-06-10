class FilmStarship < ActiveRecord::Base
  belongs_to :film
  belongs_to :starship
end
