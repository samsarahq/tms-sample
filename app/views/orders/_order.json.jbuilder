json.extract! order, :id, :from_location_id, :to_location_id, :status, :requested_pickup_at, :requested_delivery_at, :description, :created_at, :updated_at
json.url order_url(order, format: :json)
