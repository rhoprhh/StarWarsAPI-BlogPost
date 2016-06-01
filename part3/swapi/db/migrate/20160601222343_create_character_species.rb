class CreateCharacterSpecies < ActiveRecord::Migration
  def change
    create_table :character_species do |t|
      t.integer :character_id
      t.integer :specie_id
      t.timestamps null: false
    end
  end
end
