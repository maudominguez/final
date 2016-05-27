class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_secure_password

  before_save { self.email = email.downcase }

  #VALID_EMAIL_REGEX taken from Rails tutorial by Michael Hartl
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
