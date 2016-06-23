class CreateCharacterVehicles < ActiveRecord::Migration
  def change
    create_table :character_vehicles do |t|
      t.integer :character_id
      t.integer :vehicle_id
      t.timestamps null: false
    end
  end
end
