json.extract! product_watched, :id, :user_id, :product_id, :deleted_at, :created_at, :updated_at
json.url product_watched_url(product_watched, format: :json)
