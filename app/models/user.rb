class User < ApplicationRecord
    # encrypt password
  has_secure_password

  # Model associations
  # has_many :challenges, foreign_key: :created_by
  has_many :challenge_donations, foreign_key: :user_id
  # Validations
  validates_presence_of :username, :email, :password_digest
end
