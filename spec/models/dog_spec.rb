require 'rails_helper'

RSpec.describe Dog, type: :model do
  it 'is valid with a name, breed, and age' do
    user = User.create!(full_name: "Jane Doe", email: 'jane@example.com', password: 'password')
    dog = user.dogs.build(name: 'Rex', breed: 'Labrador', age: 5)
    expect(dog).to be_valid
  end

  it 'is invalid without a name' do
    dog = Dog.new(name: nil)
    dog.valid?
    expect(dog.errors[:name]).to include("can't be blank")
  end
end
