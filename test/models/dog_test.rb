# frozen_string_literal: true

require 'test_helper'

class DogTest < ActiveSupport::TestCase
  def setup
    @valid_dog = dogs(:valid)
    @invalid_dog = dogs(:invalid)
  end

  test 'valid dog' do
    assert @valid_dog.valid?
  end

  test 'validates unique name' do
    duplicate_dog = @valid_dog.dup
    assert_not duplicate_dog.valid?
  end

  test 'invalid without name' do
    refute @invalid_dog.valid?, 'saved dog without a name'
    assert_not_nil @invalid_dog.errors[:name], 'no validation error for name present'
  end
end
