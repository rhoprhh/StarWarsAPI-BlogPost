class CreatePlanetsTable < ActiveRecord::Migration
  def change
    create_table(:planets,{id: false}) do |t|
      t.integer :id
      t.string :name
      t.string :rotation_period
      t.string :orbital_period
      t.string :diameter
      t.string :climate
      t.string :gravity
      t.string :terrain
      t.string :surface_water
      t.string :population
      t.string :created
      t.string :edited
      t.string :url
    end
  end
end
