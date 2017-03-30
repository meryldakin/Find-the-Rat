class ChangeRatColName <ActiveRecord::Migration
  rename_column :criminal_captures, :rat_sighting, :rat_sighting_id
end
