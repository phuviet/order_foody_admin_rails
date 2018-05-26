class OrderItem < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  belongs_to :order
  belongs_to :product
end
