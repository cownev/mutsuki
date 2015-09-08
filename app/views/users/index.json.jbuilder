json.array!(@users) do |user|
  json.extract! user, :id, :os
  json.url user_url(user, format: :json)
end
