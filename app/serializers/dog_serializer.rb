# frozen_string_literal: true

class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :main_picture_url

  def main_picture_url
    object.main_picture.service.send(:object_for, object.main_picture.key).public_url
  end
end
