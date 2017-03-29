require 'random_name_generator'
require 'pry'
class RatSighting < ActiveRecord::Base
  has_many :criminal_captures
  has_many :users, through: :criminal_captures
  has_many :criminals, through: :criminal_captures

  def self.get_random_rat
    RatSighting.order_by_rand.first
  end

end
