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

ActiveRecord::Schema.define(version: 5) do

  create_table "criminal_captures", force: :cascade do |t|
    t.integer "criminal_id"
    t.integer "rat_sighting"
    t.integer "user_id"
    t.integer "num_guesses"
  end

  create_table "criminals", force: :cascade do |t|
    t.string "name"
    t.string "crime_type"
    t.string "crime_location"
    t.string "birthday"
    t.string "deathday"
    t.string "criminal_page_url"
    t.string "most_notorious_for"
  end

  create_table "rat_sightings", force: :cascade do |t|
    t.string   "pseudonym"
    t.datetime "timestamp"
    t.string   "location_type"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "borough"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "agent_name"
  end

end
