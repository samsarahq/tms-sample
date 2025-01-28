class CreateRoutes < ActiveRecord::Migration[8.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.datetime :scheduled_start_time
      t.datetime :scheduled_end_time
      t.datetime :actual_start_time
      t.datetime :actual_end_time
      t.json :settings
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
