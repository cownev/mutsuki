json.extract! @user, :id, :name

json.events do
  json.array!(@user.events) do |event|
    json.extract! event, :id, :name, :date
  end
end
