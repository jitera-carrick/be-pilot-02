# typed: strict
class LoginAttempt < ApplicationRecord
  belongs_to :user

  # Columns: id, created_at, updated_at, attempted_at, successful, user_id
end