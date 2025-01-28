class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :from_location, null: false, foreign_key: { to_table: :locations }
      t.references :to_location, null: false, foreign_key: { to_table: :locations }
      t.integer :status, default: 0
      t.datetime :requested_pickup_at
      t.datetime :requested_delivery_at
      t.text :description

      t.timestamps
    end
  end
end
