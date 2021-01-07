module SsoSession
  extend ActiveSupport::Concern

  def save_sso_session
    session['sso_token'] = params[:sso_token] if params[:sso_token].present?
  end
end
