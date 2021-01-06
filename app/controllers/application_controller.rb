class ApplicationController < ActionController::Base
  include SsoSession
  include SsoUrlHelper
  include SsoUser

  helper_method :sso_signup_url, :sso_signin_url, :sso_signout_url
  helper_method :current_sso_user, :sso_user_signed_in?
end
