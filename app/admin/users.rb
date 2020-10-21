ActiveAdmin.register User do

  # form do |f|
  #   inputs "Details" do
  #     input :email
  #     input :encrypted_password
  #     input :supervisor_role
  #     input :user_role
  #   end
  #   actions
  # end
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :supervisor_role
      f.input :user_role
    end
    f.actions
  end
  permit_params :email, :password, :password_confirmation, :supervisor_role, :user_role
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :uid, :supervisor_role, :user_role
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :uid, :supervisor_role, :user_role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
