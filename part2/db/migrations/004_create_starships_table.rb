class CreateStarshipsTable < ActiveRecord::Migration
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :cost_in_credits
      t.string :length
      t.string :max_atmoshperic_speed
      t.string :crew
      t.string :passengers
      t.string :cargo_capacity
      t.string :starship_class
      t.string :hyperdrive_rating
      t.string :mglt
      t.string :url
    end
  end
end
