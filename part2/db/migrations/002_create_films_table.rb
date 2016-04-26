class CreateFilmsTable < ActiveRecord::Migration
  def change
    create_table(:films, {id: false}) do |t|
      t.integer :id
      t.string :title
      t.string :episode_id
      t.text   :opening_crawl
      t.string :director
      t.string :producer
      t.string :release_date
      t.string :created
      t.string :edited
      t.string :url
    end
  end
end
