json.header do
  json.status @status
  json.message @message
end

json.content do
  json.user do
    json.extract! @user, :id, :name
  end

  json.events do
    json.array!(@user.events) do |event|
      json.extract! event, :id, :name, :date
    end
  end
end