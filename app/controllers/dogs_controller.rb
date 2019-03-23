class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
  end


  private

  def dog_params
    params.permit(:name)
  end
end
