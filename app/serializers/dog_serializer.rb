# frozen_string_literal: true

class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :main_picture_url

  def main_picture_url
    object.main_picture.service_url if object.main_picture.attached?
  end
end
