class Post < ApplicationRecord
  validates :title, :doby, presence: true
  validates :title, eniqueness:true
end
