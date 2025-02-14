class KafkaMessagesController < ApplicationController
  include Pagy::Backend

  def index
    messages = KafkaMessage.order(created_at: :desc)

    # Filter by event type if specified
    if params[:event_type] == "webhook"
      messages = messages.where("payload->>'eventType' IS NOT NULL")
    end

    # Filter by specific event types using the column
    if params[:type].present?
      messages = messages.where(event_type: params[:type])
    end

    # Allow searching within JSON payload
    if params[:q].present?
      messages = messages.where("payload::text ILIKE ?", "%#{params[:q]}%")
    end

    @pagy, @kafka_messages = pagy(messages, items: 20)

    # Get unique event types for filtering
    @event_types = KafkaMessage.distinct.pluck(:event_type).compact.sort
  end
end