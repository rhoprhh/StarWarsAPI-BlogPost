class Starship < ActiveRecord::Base

    has_many :characters
    has_many :films
    
end
