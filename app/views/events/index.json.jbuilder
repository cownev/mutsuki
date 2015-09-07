json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :private_flg, :creator_user_id
  json.url event_url(event, format: :json)
end
