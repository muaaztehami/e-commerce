class Product < ApplicationRecord
  paginates_per 2

  validates :name, presence: true,
                   length: { minimum: 2 }

  validates_numericality_of :quantity, :price, greater_than_or_equal_to: 0
  has_attached_file :image, styles: { medium: '70x70>', thumb: '70x70>' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
