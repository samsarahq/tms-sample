class WebhooksController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def create
    event = Event.create!(
      source: "samsara",
      payload: params,
      event_type: params[:eventType],
      event_id: params[:eventId]
    )

    handle_event(event)

    render json: { message: "Webhook received" }, status: :ok
  end

  def handle_event(event)
  end
end
