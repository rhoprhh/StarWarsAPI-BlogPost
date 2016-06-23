class FilmSpecie < ActiveRecord::Base
  belongs_to :film
  belongs_to :specie
end
