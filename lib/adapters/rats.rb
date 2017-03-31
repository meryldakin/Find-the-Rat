require 'pry'

class Adapter::Rats

  def initialize
    seed_rats
  end

  def pseudonym
    rng = RandomNameGenerator.new(RandomNameGenerator::GOBLIN)
    rng.compose(3)
  end

  def fetch_rats
    response = RestClient.get('https://data.cityofnewyork.us/resource/3q43-55fe.json')
    JSON.parse(response)[0..40]
  end

  def clear_rats_table
    RatSighting.delete_all
  end

  def seed_rats
    clear_rats_table
    fetch_rats.each do |hash|
      if hash["incident_address"]
        RatSighting.create(
          pseudonym: pseudonym,
          timestamp: hash["created_date"],
          location_type: hash["location_type"],
          latitude: hash["latitude"],
          longitude: hash["longitude"],
          borough: hash["borough"],
          address: hash["incident_address"]
          )
        
      end
    end
  end

end
