ActiveAdmin.register Product do

  form do |f|
    inputs "Details" do
      input :name
      input :description
      input :price
      input :quantity
      input :image 
    end
    actions
  end
  permit_params :name, :description, :price, :quantity, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :quantity, :image_file_name, :image_content_type, :image_file_size, :image_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
