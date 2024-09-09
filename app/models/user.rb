# typed: strict
class User < ApplicationRecord
  has_many :login_attempts
  has_many :password_resets

  # Add your validations here
end