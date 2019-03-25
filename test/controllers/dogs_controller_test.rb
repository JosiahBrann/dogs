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

  test "should update dog" do
    dog = Dog.create!(name: "Dog") 
    new_name = "New Name"
    dog.update!(name: new_name)

    assert_equal new_name, dog.name
  end

  test "should show dog" do 
    Dog.all.each do |dog|
      get dog_url(dog), as: :json
      assert_response :success
    end
  end

end
