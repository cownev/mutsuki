json.array!(@authorized_apps) do |authorized_app|
  json.extract! authorized_app, :id, :name, :key
  json.url authorized_app_url(authorized_app, format: :json)
end
