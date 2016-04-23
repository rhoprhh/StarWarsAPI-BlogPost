class CreatePlanetsTable < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :rotation_period
      t.string :orbital_period
      t.string :diameter
      t.string :climate
      t.string :gravity
      t.string :terrain
      t.string :surface_water
      t.string :population
      t.string :url
    end
  end
end
