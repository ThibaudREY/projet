json.extract! town, :id, :city, :postcode, :latitude, :longitude, :created_at, :updated_at, :weather
json.url town_url(town, format: :json)
