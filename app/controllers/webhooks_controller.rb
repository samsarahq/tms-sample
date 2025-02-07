class WebhooksController < ApplicationController
  skip_before_action :require_authentication, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  include Pagy::Backend

  def index
    @pagy, @webhook_events = pagy(
      WebhookEvent.order(created_at: :desc),
      items: 20
    )
  end

  def create
    event = WebhookEvent.create!(
      source: params[:source],
      payload: params.to_unsafe_h,
      status: :pending,
      event_type: params[:eventType],
    )

    handle_webhook_event(event)
  rescue => e
    event.update(status: :failed, processing_errors: e.message)
  ensure
    render json: { message: "Webhook received" }, status: :ok
  end

  private

  def handle_webhook_event(event)
    case event.event_type
    when "VehicleUpdated"
      vehicle = Vehicle.find_by(samsara_id: event.payload["data"]["vehicle"]["id"])
      vehicle.update!(
        name: event.payload["data"]["vehicle"]["name"],
        notes: event.payload["data"]["vehicle"]["notes"],
      )
      event.update(status: :processed)
    when "AddressUpdated"
      address = Location.find_by(samsara_id: event.payload["data"]["address"]["id"])
      address.update!(
        name: event.payload["data"]["address"]["name"],
        formatted_address: event.payload["data"]["address"]["formattedAddress"],
        latitude: event.payload["data"]["address"]["latitude"],
        longitude: event.payload["data"]["address"]["longitude"],
        geofence: event.payload["data"]["address"]["geofence"],
      )
      event.update(status: :processed)
    when "AddressCreated"
      address = Location.find_or_initialize_by(samsara_id: event.payload["data"]["address"]["id"])
      address.update!(
        name: event.payload["data"]["address"]["name"],
        formatted_address: event.payload["data"]["address"]["formattedAddress"],
        latitude: event.payload["data"]["address"]["latitude"],
        longitude: event.payload["data"]["address"]["longitude"],
        geofence: event.payload["data"]["address"]["geofence"],
      )
      event.update(status: :processed)
    when "DriverUpdated"
      driver = Driver.find_by(samsara_id: event.payload["data"]["driver"]["id"])
      driver.update!(
        name: event.payload["data"]["driver"]["name"],
        username: event.payload["data"]["driver"]["username"],
        status: event.payload["data"]["driver"]["driverActivationStatus"],
      )
      event.update(status: :processed)
    end
  end
end

