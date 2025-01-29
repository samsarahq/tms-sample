module Google
  class RoutePlanner
    def initialize(user)
      @user = user
    end

    def plan_route(route)
      stops = route.stops.order(:scheduled_arrival_time)



      client = Google::Client.new(@user)
      client.compute_routes(origin, destination, waypoints)
    end
  end
end
