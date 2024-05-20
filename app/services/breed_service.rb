require 'rest-client'
require 'json'

class BreedService
  include HTTParty
  # def self.list_all
  #   response = RestClient.get("https://dog.ceo/api/breeds/list/all")
  #   JSON.parse(response.body)["message"].keys
  # end

  def self.fetch_breeds
    Rails.cache.fetch("breeds", expires_in: 24.hours) do
      url = "https://dog.ceo/api/breeds/list/all"
      response = RestClient.get(url)
      if response && response.code == 200
        JSON.parse(response.body)["message"].keys
      else
        []
      end
    end
  end
end