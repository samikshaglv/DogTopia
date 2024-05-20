# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :set_breeds, only: [:new, :edit, :create, :update]

  def index
    @dogs = Dog.where(user: current_user)
  end

  def new
    @dog = Dog.new
    @breeds = BreedService.fetch_breeds # Make sure you have this service set up correctly
  end

  # Don't forget to define the create action that your form will use:
  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save
      redirect_to @dog, notice: 'Dog profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: 'Dog profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dogs/1
  def destroy
    if @dog.destroy
      redirect_to dogs_url, notice: 'Dog profile was successfully destroyed.'
    else
      redirect_to dogs_url, alert: 'Failed to destroy the dog profile.'
    end
  end

  private

  def set_dog
    @dog = current_user.dogs.find_by(id: params[:id])
    redirect_to dogs_url, alert: 'Dog not found.' if @dog.nil?
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :image)
  end

   def set_breeds
    @breeds = BreedService.fetch_breeds
  end
end
