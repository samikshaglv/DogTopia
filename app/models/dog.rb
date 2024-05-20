class Dog < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  # Before saving the dog, fetch a random image for the breed
  before_validation :load_random_image_for_breed, on: :create

  private
  def load_random_image_for_breed
    self.image = ImageService.random_image(self.breed) if self.image.blank?
  end
end
