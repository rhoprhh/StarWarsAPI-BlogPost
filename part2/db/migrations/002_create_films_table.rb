class CreateFilmsTable < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.string :episode_number
      t.text   :opening_crawl
      t.string :director
      t.string :producers
      t.string :release_date
      t.string :url
    end
  end
end
