json.extract! stop, :id, :samsara_id, :scheduled_arrival_time, :scheduled_departure_time, :actual_arrival_time, :actual_departure_time, :en_route_time, :state, :live_sharing_url, :notes, :stop_type, :route_id, :address_id, :created_at, :updated_at
json.url stop_url(stop, format: :json)
