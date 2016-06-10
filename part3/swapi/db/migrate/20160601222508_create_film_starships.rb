class CreateFilmStarships < ActiveRecord::Migration
  def change
    create_table :film_starships do |t|
      t.integer :film_id
      t.integer :starship_id
      t.timestamps null: false
    end
  end
end
