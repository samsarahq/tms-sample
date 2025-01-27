module Samsara
  class AddressService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def fetch_addresses
      @client.addresses.each do |address|
        @user.locations.find_or_create_by!(samsara_id: address["id"]) do |location|
          location.name = address["name"]
          location.formatted_address = address["formattedAddress"]
          location.latitude = address["latitude"]
          location.longitude = address["longitude"]
          location.geofence = address["geofence"]
        end
      end
    end
  end
end
