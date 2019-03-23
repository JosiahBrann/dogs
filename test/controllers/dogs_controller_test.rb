require 'test_helper'

class DogControllerTest < ActionDispatch::IntegrationTest
  Dog.destroy_all
  dogs = [
    {
      :name => "German Shepherd"
    },
    {
      :name => "Dalmation"
    }
  ]

  test "should get index" do
    get dogs_url, as: :json
    assert_response :success
  end

end
