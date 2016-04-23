class CreateSpeciesTable < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :average_height
      t.string :skin_colors
      t.string :hair_colors
      t.string :eye_colors
      t.string :average_lifespan
      t.string :language
      t.string :created
      t.string :edited
      t.string :url
    end
  end
end
