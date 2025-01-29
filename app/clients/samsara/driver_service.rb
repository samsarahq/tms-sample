module Samsara
  class DriverService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def sync_driver(driver)
      payload = {
        name: driver.name,
        username: driver.username,
        password: driver.password,
        status: driver.status,
        externalIds: {
          tmsId: driver.id
        }
      }
      if driver.samsara_id.blank?
        samsara_driver = @client.create_driver(
          body: payload
        )
        driver.update!(samsara_id: samsara_driver["id"])
      else
        @client.update_driver(
          driver.samsara_id,
          body: payload
        )
      end
    end

    def deactivate_driver(driver)
      @client.update_driver(
        driver.samsara_id,
        body: {
          driverActivationStatus: "deactivated"
        }
      )
    end

    def fetch_drivers
      # Returns:
      # { "data" => [{"id" => "52514325",
      # "name" => "CJ",
      # "username" => "cjavdev",
      # "phone" => "123456",
      # "licenseNumber" => "123456",
      # "licenseState" => "NH",
      # "eldSettings" =>
      # {"rulesets" => [{"cycle" => "USA 70 hour / 8 day", "shift" => "US Interstate Property", "restart" => "34-hour Restart", "break" => "Property (off-duty/sleeper)"}]},
      # "timezone" => "America/New_York",
      # "updatedAtTime" => "2025-01-26T18:10:32.588484Z",
      # "createdAtTime" => "2025-01-23T23:25:08.102992Z",
      # "carrierSettings" => {"carrierName" => "", "mainOfficeAddress" => "", "dotNumber" => 0, "homeTerminalName" => "", "homeTerminalAddress" => ""},
      # "driverActivationStatus" => "active",
      # "hosSetting" => {"heavyHaulExemptionToggleEnabled" => false}}]
      #
      # We want to create a Driver record for each driver
      # and update the Driver record if it already exists
      @client.drivers.each do |driver|
        d = @user.drivers.find_or_create_by!(samsara_id: driver["id"]) do |d|
          d.name = driver["name"]
          d.username = driver["username"]
          d.password ||= SecureRandom.hex(10)
          d.phone_number = driver["phone"]
          d.status = driver["driverActivationStatus"]
        end

        # If the driver in Samsara doesn't have an external ID,
        # update the driver with our internal ID.
        if driver["externalIds"].blank? || driver.fetch("externalIds", {}).fetch("tms_id", nil).blank?
          driver["externalIds"] = { "tms_id" => d.id }
          sync_driver(d)
        end
      end
    end
  end
end
