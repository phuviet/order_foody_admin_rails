json.extract! vote, :id, :product_id, :user_id, :star, :description, :deleted_at, :created_at, :updated_at
json.url vote_url(vote, format: :json)
