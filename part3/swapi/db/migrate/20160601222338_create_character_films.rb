class CreateCharacterFilms < ActiveRecord::Migration
  def change
    create_table :character_films do |t|
      t.integer :character_id
      t.integer :film_id
      t.timestamps null: false
    end
  end
end
