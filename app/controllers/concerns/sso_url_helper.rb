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
    params = { sso_redirect_url: root_url }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_out?#{params}"
  end

  def sso_get_token_url
    params = { sso_redirect_url: root_url }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/sso/credentials/get_token?#{params}"
  end

  def sso_refresh_token_url
    params = { sso_token: session['sso_token'] }.to_query
    "#{ENV['SSO_PROVIDER_URL']}/sso/credentials/refresh_token.json?#{params}"
  end
end
