class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  
  validates :delivery_address, :delivery_type, :payment_type, presence: true
 
  DELIVERY_TYPES = ["Courier(DPD)", "Personal collection", "InPost"]
  PAYMENT_TYPES  = ["Cash On Delivery", "Bank Transfer", "Dotpay"]
end
