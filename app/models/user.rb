class User < ApplicationRecord
 has_secure_password
 #before_save {self.email = email.downcase}
 #validates :username, :email, :password, presence: true
 #validates :password, length: {in: 4..16}#, massage: "Password must be with length min 4 unite"
 #validates :username, length: {minimum: 3}
 #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-\.]+\.[a-z]+\z/i
 #validates :email, eniqueness: {case_sensitive: False}, massage: "This email are using", 
                                    # format: {with: VALID_EMAIL_REGEX}
 

end
