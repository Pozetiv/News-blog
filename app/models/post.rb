class Post < ApplicationRecord
  validates :title, :doby, presence: true
end
