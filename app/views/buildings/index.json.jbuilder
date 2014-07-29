json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :location, :start, :end
  json.url building_url(experiment, format: :json)
end
