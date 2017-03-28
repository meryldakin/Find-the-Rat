class User < ActiveRecord::Base
  has_many :criminal_captures
  has_many :criminals, through: :criminal_captures
  has_many :rat_sightings, through: :criminal_captures
end
