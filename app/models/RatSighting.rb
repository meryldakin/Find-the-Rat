require 'random_name_generator'

class RatSighting < ActiveRecord::Base
  has_many :criminal_captures
  has_many :users, through: :criminal_captures
  has_many :criminals, through: :criminal_captures


  def pseudonym
    rng = RandomNameGenerator.new(RandomNameGenerator::GOBLIN)
    rng.compose(3)
  end

  def self.build_rat_table
    ApiCommunicator.get_data.each_with_index do |hash, index|
      while index < 40
        hash.each do |key, value|
          self.create()


  end


  def get_random_rat

  end


end
