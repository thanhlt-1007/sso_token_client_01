module SsoAuthenticate
  extend ActiveSupport::Concern

  included do
    before_action :save_sso_session
    before_action :sso_authenticate
  end

  def sso_authenticate
    if session['sso_token']
      if sso_user_signed_in?
        sign_in_sso_user
      else
        sign_out_sso_user
        session.delete('sso_token')
      end
    else
      redirect_to sso_get_token_url
    end
  end

  def sign_in_sso_user
    # already logged in with sso user
    return if user_signed_in? && current_user.uuid == current_sso_user.uuid

    # sign out if logged in to another user (not sso user)
    sign_out current_user if current_user

    # sign in with sso user
    sign_in current_sso_user
    redirect_to root_path
  end

  def sign_out_sso_user
    # already logout
    return unless user_signed_in?

    # logout
    sign_out current_user
    redirect_to root_path
  end
end
