json.extract! note, :id, :counselorName, :clientName, :session, :content, :created_at, :updated_at
json.url note_url(note, format: :json)
