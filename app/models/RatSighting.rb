class RatSighting < ActiveRecord::Base
  has_many :criminal_captures
  has_many :users, through: :criminal_captures
  has_many :criminals, through: :criminal_captures

  ApiCommunicator.get_data

end
