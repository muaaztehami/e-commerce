class Api::V1::CustomDevise::RegistrationsController < Devise::RegistrationsController

  #respond_to :json
  protect_from_forgery with: :null_session
  #acts_as_token_authentication_handler_for User
  before_action :ensure_params_exist, only: :create
  skip_before_action :verify_authenticity_token, only: [:create]
  #skip_before_action :authenticate_entity!, only: [:create]

  skip_before_action :authenticate_scope!
  append_before_action :authenticate_scope!, only: [:destroy]


  # POST /users
  def create
    user = User.new user_params
    if user.save
      render json: {
        email: user.email, 
        authentication_token: user.authentication_token
        }, status: :created
    else
      # clean_up_passwords resource
      render json: { errors: user.errors.full_messages },
        status: :unprocessable_entity
    end
    
  end


  # DELETE /users/UUID
  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
      }, status: :bad_request
  end

end
