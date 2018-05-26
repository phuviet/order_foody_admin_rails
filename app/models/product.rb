class Product < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  mount_uploader :avatar, ImageUploader

  # ================Association=====================
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :parent_comments, -> { where(parent_id: nil) }, class_name: Comment.name
  has_many :votes, dependent: :destroy
  has_many :products_images, dependent: :destroy

  # ================Validates=====================
  validates :category_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :deleted_at }

  # ================Scopes========================
  scope :includes_details, -> {
    includes(
      :category, :products_images, votes: :user, parent_comments: [:user, child_comments: :user]
    )
  }

  #########SELF DEF##########

  def self.products_sell
    query = <<-SQL
    SELECT
      products.name,
      products.id,
      SUM(order_items.total_price) as sum
    FROM
      products
      INNER JOIN order_items ON products.id = order_items.product_id
        AND order_items.deleted_at IS NULL
      INNER JOIN orders ON order_items.order_id = orders.id
        AND orders.deleted_at IS NULL
    WHERE to_char(orders.created_at, 'YYYY-MM') = to_char(current_date , 'YYYY-MM')
      AND products.deleted_at IS NULL
    GROUP BY
      products.name,
      products.id
    HAVING
      SUM(order_items.total_price) > 0
    ORDER BY sum DESC
    LIMIT 5
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def self.top_products(month, year)
    query = <<-SQL
    SELECT
      products.name,
      SUM(order_items.quantity) as quantity,
      SUM(order_items.total_price) as total
    FROM
      products
      INNER JOIN order_items ON products.id = order_items.product_id
        AND order_items.deleted_at IS NULL
      INNER JOIN orders ON order_items.order_id = orders.id
        AND orders.deleted_at IS NULL
    WHERE to_char(orders.created_at, 'YYYY-MM') = '#{year}-#{month}'
      AND products.deleted_at IS NULL
    GROUP BY
      products.name,
      products.id
    HAVING
      SUM(order_items.quantity) > 0
    ORDER BY quantity DESC, total DESC
    LIMIT 10
    SQL
    ActiveRecord::Base.connection.execute(query)
  end
end
