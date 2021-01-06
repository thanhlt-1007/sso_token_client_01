module SsoUrlHelper
  extend ActiveSupport::Concern

  def sso_signup_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_up?#{sso_token_params}"
  end

  def sso_signin_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_in?#{sso_token_params}"
  end

  def sso_signout_url
    "#{ENV['SSO_PROVIDER_URL']}/users/sign_out?#{sso_token_params}"
  end

  def sso_token_params
    @sso_token_params ||= { token: ENV["SSO_TOKEN"] }.to_query
  end
end
