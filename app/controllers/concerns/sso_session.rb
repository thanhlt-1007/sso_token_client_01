module SsoSession
  extend ActiveSupport::Concern

  included do
    before_action :save_sso_ssion
    before_action :handle_authenticate_for_sso_user
  end

  def save_sso_ssion
    session['sso_token'] = params[:sso_token] if params[:sso_token].present?
    # session['sso_redirect_url'] = params[:sso_redirect_url] if params[:sso_redirect_url].present?
  end

  def handle_authenticate_for_sso_user
    if sso_user_signed_in?
      if user_signed_in?
        # already loggin with current_sso_user
        return if current_user.uuid == current_sso_user.uuid

        # logout current_user
        sign_out current_user
      end

      # loggin with current_sso_user
      sign_in current_sso_user
      redirect_to root_path
    else
      if user_signed_in?
        sign_out current_user
        redirect_to root_path
      end
    end
  end
end
