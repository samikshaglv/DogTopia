# app/services/dog_api_service.rb
class DogApiService
  include HTTParty
  base_uri 'https://dog.ceo/api'

  def self.breeds
    get("/breeds/list/all").parsed_response["message"].keys
  end

  def self.breed_image(breed)
    get("/breed/#{breed}/images/random").parsed_response["message"]
  end
end
