class Comment < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  belongs_to :user
  belongs_to :product
  has_many :child_comments, class_name: Comment.name,
                            foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_comment, class_name: Comment.name, foreign_key: :parent_id,
                              optional: true
end
