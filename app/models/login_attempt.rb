# typed: strict
class LoginAttempt < ApplicationRecord
  belongs_to :user

  # Columns: id, created_at, updated_at, attempted_at, successful, user_id

  # Class method to record a login attempt
  def self.record_attempt(user_id:, attempted_at:, successful:)
    create(
      user_id: user_id,
      attempted_at: attempted_at,
      successful: successful
    )
  end
end