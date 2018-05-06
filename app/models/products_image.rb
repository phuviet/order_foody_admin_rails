class ProductsImage < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  mount_uploader :image, ImageUploader

  # ================Association=====================
  has_many :products

  # ================Validates=====================
  validates :product_id, presence: true
end
