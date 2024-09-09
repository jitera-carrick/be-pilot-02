# typed: strict
class PasswordReset < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
  validates :expires_at, presence: true
  validates :requested_at, presence: true
  validates :user_id, presence: true
end