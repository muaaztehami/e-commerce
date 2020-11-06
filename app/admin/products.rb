ActiveAdmin.register Product do
  form do |_f|
    inputs 'Details' do
      input :name
      input :description
      input :price
      input :quantity
      input :image
    end
    actions
  end
  permit_params :name, :description, :price, :quantity, :image
end
