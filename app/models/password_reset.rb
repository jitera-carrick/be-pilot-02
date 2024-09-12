# typed: strict
class PasswordReset < ApplicationRecord
  belongs_to :user
  validates :uuid, presence: true, length: { maximum: 255 }

  validates :token, presence: true
  validates :expires_at, presence: true
  validates :requested_at, presence: true
  validates :user_id, presence: true
end