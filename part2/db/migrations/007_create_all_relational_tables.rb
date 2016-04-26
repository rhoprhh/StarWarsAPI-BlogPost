class CreateAllRelationalTables < ActiveRecord::Migration


  def change
    create_table :characters_films do |t|
      t.belongs_to :character, index: true
      t.belongs_to :film, index: true
    end

    create_table :films_planets do |t|
      t.belongs_to :film, index: true
      t.belongs_to :planet, index: true
    end

    create_table :films_species do |t|
      t.belongs_to :film, index: true
      t.belongs_to :specie, index: true
    end

    create_table :films_starships do |t|
      t.belongs_to :film, index: true
      t.belongs_to :starship, index: true
    end

    create_table :films_vehicles do |t|
      t.belongs_to :film, index: true
      t.belongs_to :vehicle, index: true
    end

    create_table :characters_starships do |t|
      t.belongs_to :character, index: true
      t.belongs_to :starship, index: true
    end

    create_table :characters_vehicles do |t|
      t.belongs_to :character, index: true
      t.belongs_to :vehicle, index: true
    end

    create_table :characters_species do |t|
      t.belongs_to :character, index: true
      t.belongs_to :specie, index: true
    end

  end

end
