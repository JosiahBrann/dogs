class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

end
