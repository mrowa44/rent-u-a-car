json.array!(@rentals) do |rental|
  json.extract! rental, :id, :starts_on, :ends_on, :car
  json.url rental_url(rental, format: :json)
end
