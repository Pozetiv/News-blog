class User < ApplicationRecord
  validates :username, :email, :password_field, presence: true
end
