class CreateCriminalCaptures < ActiveRecord::Migration
  create_table :criminal_captures do |t|
    t.integer :criminal_id
    t.integer :rat_sighting
    t.integer :user_id
    t.integer :num_guesses
  end
end
