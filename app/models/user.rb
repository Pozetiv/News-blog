class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :password, length: {in: 4..16}, massage: "Password must be with length min 4 unite"
  validates :username, length: {minimum: 3}
  validates :email, eniqueness: true, massage: "This email are using"

end
