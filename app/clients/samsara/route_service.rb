module Samsara
  class RouteService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def sync_route(route)
      route_params = {
        name: route.name,
        driverId: route.driver&.samsara_id,
        vehicleId: route.vehicle&.samsara_id,
        settings: {
          routeCompletionCondition: 'arriveLastStop', # , departLastStop'
          routeStartingCondition: 'departFirstStop', # arriveFirstStop'
        },
        stops: route.stops.order(:scheduled_arrival_time).map.with_index do |stop, index|
          arrival = index.zero? ? nil : stop.scheduled_arrival_time
          departure = index == route.stops.count - 1 ? nil : stop.scheduled_departure_time

          {
            addressId: stop.location.samsara_id,
            name: stop.location.name,
            scheduledArrivalTime: arrival&.iso8601,
            scheduledDepartureTime: departure&.iso8601,
            notes: stop.full_notes,
          }
        end
      }

      if route.samsara_id.blank?
        samsara_route = @client.create_route(body: route_params)
        route.update!(samsara_id: samsara_route["id"])
      else
        @client.update_route(route.samsara_id, body: route_params)
      end
    end

    def fetch_routes
      @client.routes.each do |route|
        r = @user.routes.find_or_create_by!(samsara_id: route["id"]) do |r|
          r.name = route["name"]
        end

        if route["driverId"].present?
          r.driver = Driver.find_by(samsara_id: route["driverId"])
        end

        if route["vehicleId"].present?
          r.vehicle = Vehicle.find_by(samsara_id: route["vehicleId"])
        end
        r.settings = route["settings"]
        r.scheduled_start_time = route["scheduledRouteStartTime"]
        r.scheduled_end_time = route["scheduledRouteEndTime"]
        r.actual_start_time = route["actualRouteStartTime"]
        r.actual_end_time = route["actualRouteEndTime"]
        r.save!
      end
    end
  end
end
