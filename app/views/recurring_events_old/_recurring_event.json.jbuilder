date_format = recurring_event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
if params[:start].nil?
  events = recurring_event.schedule_recurring_events
else
  events = recurring_event.schedule_events(params[:start], params[:end])
end

json.array! events do |event|
  json.id "recurring_event_#{recurring_event.id}"
  json.title recurring_event.title
  # json.start event.strftime('%Y-%m-%d')
  # json.end (event + 1.day).strftime('%Y-%m-%d')
  json.start event.strftime(date_format)
  # json.end recurring_event.end_date.strftime(date_format)

  datetojoin = Time.parse(event.to_s).strftime("%Y-%m-%d")
  timetojoin = Time.parse(recurring_event.end_date.to_s).strftime("%T")
  joined_datetime = Time.parse(datetojoin +" "+ timetojoin).strftime("%F %T")

  json.end joined_datetime.to_datetime.strftime(date_format)

  json.color recurring_event.color unless recurring_event.color.blank?
  json.allDay recurring_event.all_day_event? ? true : false

  json.update_url recurring_event_path(recurring_event, method: :patch)
  json.edit_url edit_recurring_event_path(recurring_event)
end
