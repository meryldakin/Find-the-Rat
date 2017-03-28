class CreateRatSightings < ActiveRecord::Migration
  create_table :rat_sightings do |t|
    t.string :pseudonym
    t.datetime :timestamp
    t.string :location_type
    t.string :address
    t.float :latitude
    t.float :longitude
    t.string :borough
  end
end
