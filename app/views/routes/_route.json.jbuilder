json.extract! route, :id, :name, :scheduled_start_time, :scheduled_end_time, :actual_start_time, :actual_end_time, :settings, :driver_id, :vehicle_id, :user_id, :created_at, :updated_at
json.url route_url(route, format: :json)
