class AddEventTypeToKafkaMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :kafka_messages, :event_type, :string
  end
end
