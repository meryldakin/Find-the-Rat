class RemoveAddressColRat < ActiveRecord::Migration
  remove_column :rat_sightings, :address
end
