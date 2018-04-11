json.extract! recurring_event, :id, :title, :anchor, :frequency, :color, :created_at, :updated_at
json.url recurring_event_url(recurring_event, format: :json)
