json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :device_id
  json.url sensor_url(sensor, format: :json)
end
