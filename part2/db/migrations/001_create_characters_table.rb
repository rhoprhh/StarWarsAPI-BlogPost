class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table(:characters, {id: false}) do |t|
      t.integer :id
      t.string :name
      t.string :height
      t.string :mass
      t.string :hair_color
      t.string :skin_color
      t.string :eye_color
      t.string :birth_year
      t.string :gender
      t.string :created
      t.string :edited
      t.string :url
      t.belongs_to :planet, index: true
    end
  end
end
