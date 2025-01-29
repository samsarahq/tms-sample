class OrderStopsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @order = Order.find(params[:order_id])

    stops_changed = false

    ActiveRecord::Base.transaction do
      # Check if pickup location already exists as a stop in the route
      pickup_stop = @route.stops.find_by(location: @order.from_location)
      if pickup_stop
        OrderStop.create!(order: @order, stop: pickup_stop, stop_type: :pickup)
      else
        new_pickup_stop = @route.stops.create!(
          location: @order.from_location,
          scheduled_arrival_time: @route.scheduled_start_time
        )
        OrderStop.create!(order: @order, stop: new_pickup_stop, stop_type: :pickup)
        stops_changed = true
      end

      # Check if delivery location already exists as a stop in the route
      delivery_stop = @route.stops.find_by(location: @order.to_location)
      if delivery_stop
        OrderStop.create!(order: @order, stop: delivery_stop, stop_type: :delivery)
      else
        new_delivery_stop = @route.stops.create!(
          location: @order.to_location,
          scheduled_arrival_time: @route.scheduled_start_time
        )
        OrderStop.create!(order: @order, stop: new_delivery_stop, stop_type: :delivery)
        stops_changed = true
      end
    end

    if stops_changed
      Samsara::RouteService.new(current_user).sync_route(@route)
    end

    respond_to do |format|
      format.html { redirect_to route_path(@route), notice: 'Order was successfully added to route.' }
      format.json { render json: { status: :ok } }
    end
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to routes_path, alert: 'Route or Order not found.' }
      format.json { render json: { error: 'Route or Order not found' }, status: :not_found }
    end
  rescue ActiveRecord::RecordInvalid => e
    respond_to do |format|
      format.html { redirect_to route_path(@route), alert: e.message }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end
end