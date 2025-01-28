class CreateOrderStops < ActiveRecord::Migration[8.0]
  def change
    create_table :order_stops do |t|
      t.references :order, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.integer :stop_type, default: 0

      t.timestamps
    end

    remove_column :stops, :stop_type
  end
end
