module Samsara
  class TrailersService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def sync_trailer(trailer)
      payload = {
        name: trailer.name,
        make: trailer.make,
        model: trailer.model,
        vin: trailer.vin,
        year: trailer.year,
        licensePlate: trailer.license_plate,
        type: "trailer",
      }

      if trailer.samsara_id.blank?
        samsara_trailer = @client.create_asset(body: payload)
        trailer.update!(samsara_id: samsara_trailer["id"])
      else
        @client.update_asset(trailer.samsara_id, body: payload)
      end
    end

    def fetch_trailers
      @client.trailers.each do |trailer|
        t = @user.trailers.find_or_create_by!(samsara_id: trailer["id"])
        t.update!(
          name: trailer["name"],
          make: trailer["make"],
          model: trailer["model"],
          vin: trailer["vin"],
          year: trailer["year"],
          license_plate: trailer["licensePlate"]
        )
      end
    end
  end
end
