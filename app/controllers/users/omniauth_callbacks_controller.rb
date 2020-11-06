# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # session[:user_id] = @user.id
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
end
