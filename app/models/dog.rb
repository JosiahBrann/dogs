# frozen_string_literal: true

class Dog < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_one_attached :main_picture
  has_many_attached :pictures
end
