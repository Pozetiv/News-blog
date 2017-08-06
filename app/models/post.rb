class Post < ApplicationRecord
  has_many :comment
  validates :title, :doby, presence: true
end
