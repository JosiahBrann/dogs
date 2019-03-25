class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
  end

  def update
    @dog.update(dog_params)
    head :no_content
  end

  private

  def dog_params
    params.permit(:name)
  end
end
