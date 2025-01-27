json.extract! location, :id, :user_id, :name, :samsara_id, :formatted_address, :geofence, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
