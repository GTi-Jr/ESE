json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :serial, :password, :email, :phone, :couse, :facebook, :has_paid
  json.url user_url(user, format: :json)
end
