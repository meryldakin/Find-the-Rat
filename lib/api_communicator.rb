require 'pry'
require 'json'
require 'rest-client'


class ApiCommunicator

  def get_data
    all_data = RestClient.get('https://data.cityofnewyork.us/resource/g642-4e55.json')
    data_hash = JSON.parse(all_data)
  end

end

retrieve = ApiCommunicator.new
retrieve.get_data
retrieve.arrange_data_by_borough
