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
        # if address.geofence.present? && address.geofence.is_a?(String)
        #   payload[:geofence] = JSON.parse(address.geofence)
        # else
          payload[:geofence] = address.geofence
        # end
        @client.update_address(address.samsara_id, body: payload)
      end
    end

    def fetch_addresses
      @client.addresses.each do |address|
        next if address["id"].blank?
        next if address["name"].blank?
        next if address["formattedAddress"].blank?

        addy = @user.locations.find_or_initialize_by!(samsara_id: address["id"])
        addy.update(
          name: address["name"],
          formatted_address: address["formattedAddress"],
          latitude: address["latitude"],
          longitude: address["longitude"],
          geofence: address["geofence"],
        )
      end
    end
  end
end
