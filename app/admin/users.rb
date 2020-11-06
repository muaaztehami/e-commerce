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
end
