module SsoUrlHelper
  extend ActiveSupport::Concern

  def sso_signup_url
    params = { sso_redirect_url: root_url }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_up?#{params}"
  end

  def sso_signin_url
    params = { sso_redirect_url: root_url }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_in?#{params}"
  end

  def sso_signout_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_out"
  end

  def sso_credential_url
    params = { sso_token: session['sso_token'] }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/sso/credentials/me.json?#{params}"
  end
end
