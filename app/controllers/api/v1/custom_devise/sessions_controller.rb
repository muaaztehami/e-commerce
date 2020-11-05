class Api::V1::CustomDevise::SessionsController < Devise::SessionsController


  #respond_to :json
  before_action :update_token, only: [:destroy]
  protect_from_forgery with: :null_session
  skip_before_action :verify_signed_out_user
  #acts_as_token_authentication_handler_for User, fallback_to_devise: false
  #before_action :authenticate_api_v1_user!
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create 
    user = User.where(email: params[:email]).first
    if user&.valid_password?(params[:password])
      render json: {
              email: user.email, 
              authentication_token: user.authentication_token
            }, status: :ok
    else
      head(:unauthorized)
    end
  end


  def update_token
    current_api_v1_user.update(authentication_token: nil) if current_api_v1_user.present?
  end
  # DELETE /users/sign_out
  # def destroy
    
  #   #warden.authenticate!
  #   # user = User.where(email: params[:email]).first
  #   puts "......"
  #   puts current_user
  #   puts "..........."
  #   current_user.authentication_token = nil
  #   current_user.save!
  #   render json: {
  #     email: user.email, 
  #     authentication_token: user.authentication_token
  #   }, status: :ok
  # end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  
  # def reset_token(resource)
  #   resource.authentication_token = nil
  #   resource.save!
  # end

  # def load_user
  #   @user = User.find_for_database_authentication(email: sign_in_params[:email])
  #   if @user
  #     return @user
  #   else
  #     render json: {
  #       messages: "Cannot get User",
  #       data: {}
  #     }, status: :failure
  #   end
  # end

end

