module Google
  class Client < BaseClient
    BASE_URI = "https://routes.googleapis.com"

    def compute_routes(origin, destination, waypoints = [])
      get("/directions/v2:computeRoutes", {
        origin: origin,
        destination: destination,
        intermediates: waypoints,
        travelMode: "DRIVE",
        routingPreference: "TRAFFIC_AWARE_OPTIMAL",
        optimizeWaypointOrder: true,
      })
    end
  end
end
