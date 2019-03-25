class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :update, :destroy]

  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
  end

  def show
    json_response(@dog)
  end

  def update
    @dog.update(dog_params)
    head :no_content
  end

  def search
    search_term = params[:query] || nil
    dogs = Dog.where("name ILIKE '%#{search_term}%'") if search_term 
    render json: dogs
  end

  private

  def dog_params
    params.permit(:name)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

end
