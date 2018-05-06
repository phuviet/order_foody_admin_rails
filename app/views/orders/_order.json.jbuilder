json.extract! order, :id, :receiver, :address, :phone, :status, :user_id, :deleted_at, :created_at, :updated_at
json.url order_url(order, format: :json)
