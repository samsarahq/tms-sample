module Samsara
  class RouteService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
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
