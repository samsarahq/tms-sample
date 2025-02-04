class CreateWebhookEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :webhook_events do |t|
      t.string :source, null: false
      t.json :payload, null: false, default: {}
      t.integer :status, null: false, default: 0
      t.text :processing_errors
      t.string :event_type

      t.timestamps
    end
  end
end
