class Vote < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  belongs_to :product
  belongs_to :user
end
