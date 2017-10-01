class Contact < ApplicationRecord

  validates :title, presence: true, length: {minimum: 4}
  validates :body, presence: true, length: {minimum: 4}
  validates :email, presence: true
  default_scope -> {order(created_at: :desc)}
end
