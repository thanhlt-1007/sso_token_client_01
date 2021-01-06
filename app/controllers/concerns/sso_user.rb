module SsoUser
  extend ActiveSupport::Concern

  def current_sso_user
  end

  def sso_user_signed_in?
  end
end
