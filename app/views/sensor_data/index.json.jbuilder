json.array!(@sensor_data) do |sensor_datum|
  json.extract! sensor_datum, :id, :title, :data
  json.url sensor_datum_url(sensor_datum, format: :json)
end
