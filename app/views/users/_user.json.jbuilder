json.extract! user, :id, :email, :password_digest, :first_name, :last_name, :middle_name, :phone, :address, :gender, :birthday, :avatar, :auth_token, :confirm_send_at, :confirm_token, :confirm_at, :reset_send_at, :reset_token, :deleted_at, :role_id, :created_at, :updated_at
json.url user_url(user, format: :json)
