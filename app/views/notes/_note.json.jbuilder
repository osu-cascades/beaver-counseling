json.extract! note, :id, :session_number, :client_name, :counselor_name, :status, :content, :client_id, :created_at, :updated_at
json.url note_url(note, format: :json)
