class CreateFilmSpecies < ActiveRecord::Migration
  def change
    create_table :film_species do |t|
      t.integer :film_id
      t.integer :specie_id
      t.timestamps null: false
    end
  end
end
