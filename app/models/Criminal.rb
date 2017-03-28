class Criminal < ActiveRecord::Base
  has_many :criminal_captures
  has_many :users, through: :criminal_captures
  has_many :rat_sightings, through: :criminal_captures
end
