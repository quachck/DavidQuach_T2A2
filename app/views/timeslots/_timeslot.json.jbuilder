json.extract! timeslot, :id, :workshop_id, :day, :start_time, :end_time, :price, :total_tickets, :available_tickets, :created_at, :updated_at
json.url timeslot_url(timeslot, format: :json)
