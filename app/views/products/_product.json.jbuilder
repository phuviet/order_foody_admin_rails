json.extract! product, :id, :name, :price, :avatar, :description, :star, :category_id, :deleted_at, :created_at, :updated_at
json.url product_url(product, format: :json)
