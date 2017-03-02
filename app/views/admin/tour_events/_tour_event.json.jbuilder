json.extract! tour_event, :id, :title, :description, :created_at, :updated_at
json.url tour_event_url(tour_event, format: :json)