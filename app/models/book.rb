# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  mount_uploader :picture, PictureUploader
  paginates_per 10
  validates :title, presence: true
end
