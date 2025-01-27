json.extract! vehicle, :id, :make, :model, :name, :year, :samsara_id, :notes, :vin, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
