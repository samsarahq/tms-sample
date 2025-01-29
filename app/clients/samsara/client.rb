module Samsara
  class Client < BaseClient
    BASE_URI = "https://api.samsara.com"

    def initialize(user)
      @user = user

      super(token: access_token)
    end

    def access_token
      credentials = @user.samsara_credentials
      if credentials.blank?
        raise "No Samsara credentials found for user #{@user.id}"
      end

      if credentials["refresh_token"].blank?
        raise "No refresh token found for user #{@user.id}"
      end

      if credentials["expires_at"] < Time.now.to_i
        # Refresh the token
        puts "Using refresh token to get new access token #{credentials["refresh_token"]}..."
        credentials = refresh_credentials(credentials["refresh_token"])
        if !credentials["access_token"].blank? && !credentials["refresh_token"].blank?
          @user.update!(samsara_credentials: credentials)
        else
          raise "Failed to refresh credentials: #{credentials}"
        end
      end

      credentials["access_token"]
    end

    def addresses
      result = get("/addresses")
      result.parsed_body["data"]
    end

    def create_address(body: {})
      result = post("/addresses", body: body)
      result.parsed_body["data"]
    end

    def update_address(address_id, body: {})
      result = patch("/addresses/#{address_id}", body: body)
      result.parsed_body["data"]
    end

    def drivers
      result = get("/fleet/drivers")
      result.parsed_body["data"]
    end

    def update_driver(driver_id, body: {})
      result = patch("/fleet/drivers/#{driver_id}", body: body)
      result.parsed_body["data"]
    end

    def create_driver(body: {})
      result = post("/fleet/drivers", body: body)
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

    def driver_clocks(driver_ids)
      result = get("/fleet/hos/clocks", query: { driverIds: driver_ids })
      result.parsed_body["data"]
    end

    def update_route(route_id, body: {})
      result = patch("/fleet/routes/#{route_id}", body: body)
      result.parsed_body["data"]
    end

    def create_route(body: {})
      result = post("/fleet/routes", body: body)
      result.parsed_body["data"]
    end

    def routes(start_time: 1.day.ago, end_time: 1.day.from_now, limit: 100)
      result = get("/fleet/routes", query: {
        startTime: start_time.iso8601,
        endTime: end_time.iso8601,
        limit: limit
      })
      result.parsed_body["data"]
    end

    def oauth_auth_header
      client_id = Rails.application.credentials.samsara[:client_id]
      client_secret = Rails.application.credentials.samsara[:client_secret]
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def refresh_credentials(refresh_token)
      puts "REFRESHING CREDENTIALS...."
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
      if response.code != "200"
        raise "Failed to refresh credentials: #{response.body}"
      end

      token_data = JSON.parse(response.body)

      # Calculate new expires_at timestamp
      expires_at = Time.now.to_i + token_data['expires_in'].to_i

      token_data['expires_at'] = expires_at
      token_data
    end
  end
end
