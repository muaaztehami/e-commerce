class UpdateDefaultValueInProduct < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, default: 0
    change_column :products, :quantity, :integer, default: 0
  end
end
