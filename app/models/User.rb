class User < ActiveRecord::Base
  has_many :criminal_captures
  has_many :criminals, through: :criminal_captures
  has_many :rat_sightings, through: :criminal_captures

  attr_reader :agent_name

  def user_pseudonym
    rng = RandomNameGenerator.new(RandomNameGenerator::ROMAN)
    rng.compose(3)
  end

  def assign_agent_name
    self.agent_name = user_pseudonym

  end

end
