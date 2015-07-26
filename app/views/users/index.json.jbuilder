json.array!(@users) do |user|
  json.extract! user, :id, :fid, :gender, :bday
  json.url user_url(user, format: :json)
end
