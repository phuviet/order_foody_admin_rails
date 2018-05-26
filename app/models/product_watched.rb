class ProductWatched < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  belongs_to :user
  belongs_to :product
end
