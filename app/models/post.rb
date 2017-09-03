class Post < ApplicationRecord
  validates :title, :body, presence: true
  mount_uploaders :image, ImageUploader
  serialize :image, JSON
end
