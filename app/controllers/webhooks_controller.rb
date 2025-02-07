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
      event_type: params[:event_type],
    )

    render json: { message: "Webhook received" }, status: :ok
  end
end
