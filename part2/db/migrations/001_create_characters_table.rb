class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :height
      t.string :mass
      t.string :hair_color
      t.string :skin_color
      t.string :eye_color
      t.string :birthyear
      t.string :gender
      t.string :url
    end
  end
end
