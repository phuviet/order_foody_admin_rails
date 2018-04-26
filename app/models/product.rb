class Product < ApplicationRecord
  belongs_to :category

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
      INNER JOIN orders ON order_items.order_id = orders.id
    WHERE to_char(orders.created_at, 'YYYY-MM') = to_char(current_date , 'YYYY-MM')
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
end
