json.array!(@connections) do |connection|
  json.extract! connection, :id, :rating, :date, :location, :comments
  json.url connection_url(connection, format: :json)
end
