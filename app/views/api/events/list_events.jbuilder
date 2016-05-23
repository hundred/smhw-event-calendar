json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :info
  json.start event.start_time.to_date
  json.end event.end_time.to_date
  json.url ""
end
