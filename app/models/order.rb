class Order < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  belongs_to :user

  # ================ENUMS=====================
  enum status: %w[ordered paid shipped completed declined]
end
