require 'pry'
class Criminal < ActiveRecord::Base
  has_many :criminal_captures
  has_many :users, through: :criminal_captures
  has_many :rat_sightings, through: :criminal_captures


  @@suspects = []

  def self.get_random_suspects
    @@suspects = Criminal.order_by_rand.limit(7)

  end

  def self.select_mastermind
    @@suspects.sample
  end

  

  def self.clear_suspects
    @@suspects = []
  end


end
