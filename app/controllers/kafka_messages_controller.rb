class KafkaMessagesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @kafka_messages = pagy(
      KafkaMessage.order(created_at: :desc),
      items: 20
    )
  end
end