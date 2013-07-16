class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :firstname, presence: true, length: { maximum: 50 }
    validates :middlename, length: { maximum: 50 }
    validates :lastname, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
end