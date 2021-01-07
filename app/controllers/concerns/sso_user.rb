module SsoUser
  extend ActiveSupport::Concern

  def current_sso_user
    return @current_sso_user if @current_sso_user.present?

    response ||= JSON.parse((Faraday.get sso_refresh_token_url).body)
    return if response['uuid'].blank?

    user = User.find_or_initialize_by(uuid: response['uuid'])
    if user.new_record?
      user.update(email: response['email'], password: 'Aa@123456')
    else
      user.update(email: response['email'])
    end

    @current_sso_user = user
  end

  def sso_user_signed_in?
    current_sso_user.present?
  end
end
