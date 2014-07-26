json.array!(@users) do |user|
  json.extract! user, :id, :fid
  json.url user_url(user, format: :json)
end
