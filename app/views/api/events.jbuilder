json.header do
  json.status @status
  json.message @message
end

json.content do
  json.events do
    json.array!(@events) do |event|
      json.extract! event, :id, :name, :date
    end
  end
end
