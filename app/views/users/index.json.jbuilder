json.array!(@users) do |user|
  json.extract! user, :id, :name, :gender, :birthday
  json.url user_url(user, format: :json)
end
