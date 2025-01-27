module Samsara
  class Client < BaseClient
    BASE_URI = "https://api.samsara.com"

    def initialize(user)
      @user = user

      super(token: access_token)
    end

    def access_token
      credentials = @user.samsara_credentials
      if credentials["expires_at"] < Time.now.to_i
        # Refresh the token
        credentials = refresh_credentials(credentials["refresh_token"])
        @user.update!(samsara_credentials: credentials)
      end

      credentials["access_token"]
    end

    def drivers
      result = get("/fleet/drivers")
      result.parsed_body["data"]
    end

    def vehicles
      result = get("/fleet/vehicles")
      result.parsed_body["data"]
    end

    def vehicle_stats(vehicle_ids, types: "gps")
      result = get(
        "/fleet/vehicles/stats",
        query: {
          vehicleIds: vehicle_ids,
          types: types
        }
      )
      result.parsed_body["data"]
    end

    def addresses
      result = get("/addresses")
      result.parsed_body["data"]
    end

    def driver_clocks(driver_ids)
      result = get("/fleet/hos/clocks", query: { driverIds: driver_ids })
      result.parsed_body["data"]
    end

    def oauth_auth_header
      client_id = Rails.application.credentials.samsara[:client_id]
      client_secret = Rails.application.credentials.samsara[:client_secret]
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def refresh_credentials(refresh_token)
      uri = URI('https://api.samsara.com/oauth2/token')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      request['Authorization'] = "Basic #{oauth_auth_header}"
      request.body = URI.encode_www_form({
        refresh_token: refresh_token,
        grant_type: 'refresh_token'
      })

      response = http.request(request)
      token_data = JSON.parse(response.body)

      # Calculate new expires_at timestamp
      expires_at = Time.now.to_i + token_data['expires_in'].to_i

      token_data['expires_at'] = expires_at
      token_data
    end
  end
end
