class CreateKafkaMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :kafka_messages do |t|
      t.string :topic, null: false
      t.string :key
      t.json :payload, default: {}
      t.text :processing_errors, default: ''

      t.timestamps
    end
  end
end
