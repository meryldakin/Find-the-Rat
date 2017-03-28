class CreateCriminals < ActiveRecord::Migration
  create_table :criminals do |t|
    t.string :name
    t.string :crime_type
    t.string :crime_location
    t.string :birthday
    t.string :deathday
    t.string :criminal_page_url
    t.string :most_notorious_for
  end
end
