require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  let(:user) { User.create!(full_name: "John Doe", email: 'john@example.com', password: 'password') }
  let(:valid_attributes) { { name: 'Buddy', breed: 'Beagle', age: 3, user_id: user.id } }
  let(:invalid_attributes) { { name: nil, breed: 'Beagle', age: 3, user_id: user.id } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      Dog.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Dog" do
        expect {
          post :create, params: { dog: valid_attributes }
        }.to change(Dog, :count).by(1)
      end

      it "redirects to the created dog" do
        post :create, params: { dog: valid_attributes }
        expect(response).to redirect_to(Dog.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { dog: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
