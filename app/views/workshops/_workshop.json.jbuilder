json.extract! workshop, :id, :user_id, :title, :description, :category, :skill_level, :location, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)
