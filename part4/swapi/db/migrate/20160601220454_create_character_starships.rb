class CreateCharacterStarships < ActiveRecord::Migration
  def change
    create_table :character_starships do |t|
      t.integer :character_id
      t.integer :starship_id
      t.timestamps null: false
    end
  end
end
