json.header do
  json.status @status
  json.message @message
end

json.content do
  json.user do
    json.extract! @user, :id
  end
end
