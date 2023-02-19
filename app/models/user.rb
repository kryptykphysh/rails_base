# User is the core model for users of the application
class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: { case_insensitive: true }
  validates :first_name, presence: true
  validates :password_digest, presence: true
  validates :surname, presence: true
end
