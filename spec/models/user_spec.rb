require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a full_name and email' do
    user = User.new(full_name: "John Doe", email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without a full_name' do
    user = User.new(full_name: nil)
    user.valid?
    expect(user.errors[:full_name]).to include("can't be blank")
  end
end
