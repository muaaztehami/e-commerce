class Product < ApplicationRecord
  validates :name, presence: true,
                  length: {minimum: 2}
  has_attached_file :image, styles: { medium: "70x70>", thumb: "70x70>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :cart_items, dependent: :destroy

end
