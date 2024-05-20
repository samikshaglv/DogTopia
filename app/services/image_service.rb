require 'rest-client'
require 'json'

class ImageService
  def self.random_image(breed)
    response = RestClient.get("https://dog.ceo/api/breed/#{breed}/images/random")
    JSON.parse(response.body)["message"]
  end
end
