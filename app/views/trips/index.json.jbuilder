json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :origin, :destination, :price, :in-date, :out-date, :type, :description
  json.url trip_url(trip, format: :json)
end
