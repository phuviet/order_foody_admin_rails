json.extract! products_image, :id, :image, :product_id, :deleted_at, :created_at, :updated_at
json.url products_image_url(products_image, format: :json)
