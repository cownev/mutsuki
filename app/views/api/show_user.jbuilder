json.header do
  json.status @status
  json.message @message
end

json.content do
  json.user do
    json.extract! @user, :id
  end

  json.events do
    json.array!(@events) do |event|
      json.extract! event, :id, :name, :date, :creator_user_id
    end
  end
end
