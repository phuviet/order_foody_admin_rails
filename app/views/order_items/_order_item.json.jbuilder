json.extract! order_item, :id, :total_price, :quantity, :order_id, :product_id, :deleted_at, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
