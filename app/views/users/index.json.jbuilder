json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :gender, :birthday, :picture, :password_digest, :location
  json.url user_url(user, format: :json)
end
