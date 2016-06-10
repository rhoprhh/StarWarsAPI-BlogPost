class CreateFilmVehicles < ActiveRecord::Migration
  def change
    create_table :film_vehicles do |t|
      t.integer :film_id
      t.integer :vehicle_id
      t.timestamps null: false
    end
  end
end
