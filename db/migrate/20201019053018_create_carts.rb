class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.boolean :cart_status, default: false

      t.timestamps
    end
  end
end
