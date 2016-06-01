class CreateFilmPlanets < ActiveRecord::Migration
  def change
    create_table :film_planets do |t|
      t.integer :film_id
      t.integer :planet_id
      t.timestamps null: false
    end
  end
end
