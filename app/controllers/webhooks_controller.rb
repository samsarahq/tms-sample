class WebhooksController < ApplicationController
  skip_before_action :require_authentication
  skip_before_action :verify_authenticity_token

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
