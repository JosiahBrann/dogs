# frozen_string_literal: true

class DogsController < ApplicationController
  before_action :set_dog, only: %i[show update destroy]

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
    page = params[:page] || 1
    page_length = params[:page_length] || 10
    offset = ((page.to_i - 1) * page_length.to_i) || 0
    search_term = params[:query] || nil
    if search_term
      dogs = Dog
             .where("name ILIKE '%#{search_term}%'")
             .limit(page_length)
             .offset(offset)
    end
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
