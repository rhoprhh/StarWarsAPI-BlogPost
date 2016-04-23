class CreateVehiclesTable < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :cost_in_credits
      t.string :length
      t.string :max_atmoshperic_speed
      t.string :crew
      t.string :passengers
      t.string :cargo_capacity
      t.string :vehicle_class
      t.string :url
    end
  end
end
