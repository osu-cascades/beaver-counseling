json.extract! client, :id, :first_name, :created_at, :updated_at
json.url client_url(client, format: :json)
