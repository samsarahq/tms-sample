module Samsara
  class AddressService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def sync_address(address)
      payload = {
        name: address.name,
        formattedAddress: address.formatted_address,
        latitude: address.latitude,
        longitude: address.longitude,
      }

      if address.samsara_id.blank?
        payload[:geofence] = {
          circle: {
            latitude: address.latitude,
            longitude: address.longitude,
            radiusMeters: 25
          }
        }
        samsara_address = @client.create_address(body: payload)
        address.update!(samsara_id: samsara_address["id"])
      else
        payload[:geofence] = address.geofence
        @client.update_address(address.samsara_id, body: payload)
      end
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
