class Post < ApplicationRecord
  validates :title, :doby, presence: true
  mount_uploaders :image, ImageUploader
  serialize :image, JSON
end
