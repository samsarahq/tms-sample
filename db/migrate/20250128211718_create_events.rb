class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :source
      t.json :payload
      t.string :status
      t.text :processing_errors
      t.string :event_type
      t.string :event_id

      t.timestamps
    end
  end
end
