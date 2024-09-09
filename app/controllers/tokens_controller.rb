# frozen_string_literal: true

class TokensController < Doorkeeper::TokensController
  include Api::BaseController

  # callback
  before_action :validate_resource_owner

  # methods

  def validate_resource_owner
    return if resource_owner.blank?

    if resource_owner_locked?
      render json: {
        error: I18n.t('common.errors.token.locked'),
        message: I18n.t('common.errors.token.locked')
      }, status: :unauthorized
    end
    return if resource_owner_confirmed?

    render json: {
             error: I18n.t('common.errors.token.inactive'),
             message: I18n.t('common.errors.token.inactive')
           },
           status: :unauthorized
  end

  def resource_owner
    return nil if action_name == 'revoke'

    return unless authorize_response.respond_to?(:token)

    authorize_response&.token&.resource_owner
  end

  def resource_owner_locked?
    resource_owner.access_locked?
  end

  def resource_owner_confirmed?
    # based on condition jitera studio
  end

  # New login action
  def login
    email = params[:email]
    password = params[:password]
    keep_session = params[:keepSession]

    # Step 2: Validate the input data
    raise Exceptions::AuthenticationError, 'Email and password cannot be blank' if email.blank? || password.blank?

    # Step 3: Query the 'users' table
    user = User.find_by(email: email)
    raise Exceptions::AuthenticationError, 'Invalid email or password' unless user

    # Step 4 & 5: Verify the password
    if user.verify_password(password)
      # Step 5: Create a session token
      session_token = create_session_token(user, keep_session)

      # Step 7: Update the user's record with the new session token and expiry
      user.update_session(session_token, keep_session)

      # Step 8: Record the login attempt
      LoginAttempt.record_attempt(user_id: user.id, attempted_at: Time.current, successful: true)

      # Step 9: Return the success message and session token
      render_login_response(session_token)
    else
      # Record the failed login attempt
      LoginAttempt.record_attempt(user_id: user.id, attempted_at: Time.current, successful: false)
      raise Exceptions::AuthenticationError, 'Invalid email or password'
    end
  rescue Exceptions::AuthenticationError => e
    render json: { error: e.message }, status: :unauthorized
  end
end