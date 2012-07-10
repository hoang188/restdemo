class User < ActiveRecord::Base
  attr_accessible :company, :email, :interest, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email == email.downcase }

  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presense: true
end
