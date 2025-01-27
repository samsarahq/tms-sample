module Samsara
  class Client < BaseClient
    BASE_URI = "https://api.samsara.com"

    def initialize(api_key)
      super(token: api_key)
    end

    def drivers
      get("/fleet/drivers")
    end
  end
end
