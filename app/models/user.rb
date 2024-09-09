# typed: strict
class User < ApplicationRecord
  has_many :login_attempts
  has_many :password_resets

  # Add your validations here

  # Verifies if the provided password matches the hashed password in the database
  def verify_password(plain_password)
    # Assuming 'password_digest' is the actual field where the hashed password is stored
    # and 'BCrypt::Password.new' is used to compare the hashed password with the plain password.
    # This is a placeholder for the actual password verification logic which would typically use bcrypt.
    BCrypt::Password.new(self.password_digest) == plain_password
  end

  # Updates the user's session with the new token and expiry
  def update_session(session_token, session_expiry)
    self.update(session_token: session_token, session_expiry: session_expiry)
  end
end