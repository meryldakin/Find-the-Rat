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
    data = JSON.parse(response)[0..40]
    data.each do |hash|
      RatSighting.create(
        pseudonym: pseudonym,
        timestamp: hash["created_date"],
        location_type: hash["location_type"],
        latitude: hash["latitude"],
        longitude: hash["longitude"],
        borough: hash["borough"]
        )
    end
  end
end
