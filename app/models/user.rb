class User < ApplicationRecord
  #user_name
before_save {self.email = email.downcase}
  validates :name, presence: true, length:  {in: 3..15}

#e-mail
  #VALID_EMAIL_REGEX = /\A[\w+\-,]+@[a-z\d\-,]+\,[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
           #format: {with: VALID_EMAIL_REGEX},
           uniqueness: {case_sensitive: false}
    #password
  has_secure_password
  validates :password, presence: true, length: {in: 4..16}


end
