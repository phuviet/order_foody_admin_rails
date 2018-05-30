class RevenueController < ApplicationController
  authorize_resource class: false

  def index
    query = <<-SQL
      WITH dates_of_week AS (
        SELECT DATE '2008-01-01' + (interval '1' month * generate_series(0,11)) as date
      )
      SELECT extract(month from dates_of_week.date) as mon, COALESCE(SUM(total_price), 0) as total
      FROM dates_of_week
        LEFT JOIN orders ON extract(month from dates_of_week.date) = extract(month from orders.created_at) AND orders.deleted_at IS NULL
        LEFT JOIN order_items ON orders.id = order_items.order_id AND order_items.deleted_at IS NULL
      GROUP BY mon
      ORDER BY mon
    SQL
    @revenues = ActiveRecord::Base.connection.execute(query).to_a
    @revenues.each_with_object([]) do |revenue, data|
      revenue['mon'] = revenue['mon'].to_i.to_s
      data << revenue
    end
  end
end
