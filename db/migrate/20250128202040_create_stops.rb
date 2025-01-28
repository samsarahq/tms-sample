class CreateStops < ActiveRecord::Migration[8.0]
  def change
    create_table :stops do |t|
      t.string :samsara_id
      t.datetime :scheduled_arrival_time
      t.datetime :scheduled_departure_time
      t.datetime :actual_arrival_time, null: true
      t.datetime :actual_departure_time, null: true
      t.datetime :en_route_time, null: true
      t.integer :state, default: 0
      t.string :live_sharing_url, null: true
      t.text :notes
      t.integer :stop_type, default: 0
      t.references :route, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
