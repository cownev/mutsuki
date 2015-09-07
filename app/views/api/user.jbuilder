json.header do
  json.status @status
  json.message @message
end

json.content do
  json.user do
    json.extract! @user, :id
  end

  json.events do
    json.array!(@user.events) do |event|
      json.extract! event, :id, :name, :date, :creator_user_id
      json.private_flg (event.private_flg ? 1 : 0)
    end
  end
end
