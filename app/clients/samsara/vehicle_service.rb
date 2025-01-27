module Samsara
  class VehicleService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def fetch_vehicles
      ids_for_stats = []
      @client.vehicles.each do |samsara_vehicle|
        vehicle = @user.vehicles.find_or_create_by!(samsara_id: samsara_vehicle["id"]) do |v|
          v.make = samsara_vehicle["make"]
          v.model = samsara_vehicle["model"]
          v.year = samsara_vehicle["year"]
          v.vin = samsara_vehicle["vin"]
        end

        vehicle.update!(
          name: samsara_vehicle["name"],
          notes: samsara_vehicle["notes"]
        )

        ids_for_stats << vehicle.samsara_id
      end

      @client.vehicle_stats(ids_for_stats, types: "gps").each do |vehicle_stats|
        vehicle = @user.vehicles.find_by!(samsara_id: vehicle_stats["id"])
        vehicle.update!(
          latitude: vehicle_stats["gps"]["latitude"],
          longitude: vehicle_stats["gps"]["longitude"]
        )
      end
    end
  end
end
