class CriminalCapture < ActiveRecord::Base
  belongs_to :criminal_capture
  belongs_to :user
  belongs_to :rat_sighting
end
