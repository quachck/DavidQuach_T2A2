json.extract! booking, :id, :user_id, :workshop_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
