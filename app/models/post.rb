class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  default_scope -> {order(created_at: :desc)}
  validates :title, :body, presence: true


end
