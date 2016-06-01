# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160601222518) do

  create_table "character_films", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "film_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_species", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "specie_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_starships", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "starship_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_vehicles", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "vehicle_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "characters", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
    t.string  "height"
    t.string  "mass"
    t.string  "hair_color"
    t.string  "skin_color"
    t.string  "eye_color"
    t.string  "birth_year"
    t.string  "gender"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
    t.integer "planet_id"
  end

  add_index "characters", ["planet_id"], name: "index_characters_on_planet_id"

  create_table "film_planets", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_species", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "specie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_starships", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "starship_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "film_vehicles", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "title"
    t.string  "episode_id"
    t.text    "opening_crawl"
    t.string  "director"
    t.string  "producer"
    t.string  "release_date"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
  end

  create_table "planets", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
    t.string  "rotation_period"
    t.string  "orbital_period"
    t.string  "diameter"
    t.string  "climate"
    t.string  "gravity"
    t.string  "terrain"
    t.string  "surface_water"
    t.string  "population"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
  end

  create_table "species", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
    t.string  "classification"
    t.string  "designation"
    t.string  "average_height"
    t.string  "skin_colors"
    t.string  "hair_colors"
    t.string  "eye_colors"
    t.string  "average_lifespan"
    t.string  "language"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
  end

  create_table "starships", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
    t.string  "model"
    t.string  "manufacturer"
    t.string  "cost_in_credits"
    t.string  "length"
    t.string  "max_atmoshpering_speed"
    t.string  "crew"
    t.string  "passengers"
    t.string  "cargo_capacity"
    t.string  "consumables"
    t.string  "starship_class"
    t.string  "hyperdrive_rating"
    t.string  "MGLT"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
  end

  create_table "vehicles", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
    t.string  "model"
    t.string  "manufacturer"
    t.string  "cost_in_credits"
    t.string  "length"
    t.string  "max_atmoshpering_speed"
    t.string  "crew"
    t.string  "passengers"
    t.string  "cargo_capacity"
    t.string  "consumables"
    t.string  "vehicle_class"
    t.string  "created"
    t.string  "edited"
    t.string  "url"
  end

end
