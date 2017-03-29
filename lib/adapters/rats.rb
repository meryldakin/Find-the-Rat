require 'pry'

class Adapter::Rats

  def initialize
    seed_rats
  end

  def pseudonym
    rng = RandomNameGenerator.new(RandomNameGenerator::FANTASY)
    rng.compose(3)
  end

  # def fetch_rats
  #   response = RestClient.get('https://data.cityofnewyork.us/resource/3q43-55fe.json')
  #   data = JSON.parse(response)
  #   data
  # end

  def clear_rats_table
    RatSighting.delete_all
  end

  def seed_rats
    clear_rats_table
    counter = 0
    response = RestClient.get('https://data.cityofnewyork.us/resource/3q43-55fe.json')
    data = JSON.parse(response)
    data.each do |hash|
      while counter < 40
      RatSighting.create(
        pseudonym: pseudonym,
        timestamp: hash["created_date"],
        location_type: hash["location_type"],
        latitude: hash["location"]["latitude"],
        longitude: hash["location"]["longitude"],
        borough: hash["borough"]
        )
      counter += 1
      binding.pry
      end

    end
  end
end
