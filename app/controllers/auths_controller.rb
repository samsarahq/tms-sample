class AuthsController < ApplicationController

  def samsara
    # Generate state parameter for CSRF protection
    state = SecureRandom.hex(10)
    session[:oauth_state] = state

    # Construct authorization URL
    auth_params = {
      client_id: Rails.application.credentials.samsara[:client_id],
      response_type: 'code',
      state: state,
      redirect_uri: "#{request.base_url}/auth/samsara/callback"
    }

    query_string = URI.encode_www_form(auth_params)
    redirect_to "https://api.samsara.com/oauth2/authorize?#{query_string}", allow_other_host: true
  end

  def samsara_callback
    # Verify state parameter to prevent CSRF
    if params[:state] != session[:oauth_state]
      return render plain: "Invalid state parameter"
    end

    # Exchange authorization code for access token
    if params[:code]
      client_id = Rails.application.credentials.samsara[:client_id]
      client_secret = Rails.application.credentials.samsara[:client_secret]
      auth = Base64.strict_encode64("#{client_id}:#{client_secret}")

      uri = URI('https://api.samsara.com/oauth2/token')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      request['Authorization'] = "Basic #{auth}"
      request.body = URI.encode_www_form({
        code: params[:code],
        grant_type: 'authorization_code'
      })

      response = http.request(request)

      if response.code == '200'
        token_data = JSON.parse(response.body)
        expires_in = token_data['expires_in']

        # Calculate expires_at timestamp
        expires_at = Time.now.to_i + token_data['expires_in'].to_i

        token_data['expires_at'] = expires_at

        # Store credentials in user record
        current_user.update!(samsara_credentials: token_data)

        redirect_to root_path
      else
        render plain: "Error obtaining access token: #{response.body}"
      end
    else
      render plain: params[:error]
    end
  end
end
