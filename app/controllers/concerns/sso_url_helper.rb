module SsoUrlHelper
  extend ActiveSupport::Concern

  def sso_signup_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_up?#{sso_params}"
  end

  def sso_signin_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_in?#{sso_params}"
  end

  def sso_signout_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_out?#{sso_params}"
  end

  def sso_credential_url
    "#{ENV['SSO_PROVIDER_URL']}/sso/credentials/me.json?#{sso_params}"
  end

  def sso_params
    if session['sso_token'].present?
      @sso_params ||= { sso_token: session['sso_token'] }.to_query
    else
      @sso_params ||= { sso_redirect_url: root_url }.to_query
    end
  end
end
