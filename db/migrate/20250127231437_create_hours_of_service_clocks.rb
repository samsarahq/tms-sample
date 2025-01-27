class CreateHoursOfServiceClocks < ActiveRecord::Migration[8.0]
  def change
    create_table :hours_of_service_clocks do |t|
      t.references :driver, null: false, foreign_key: true
      t.integer :time_until_break_ms
      t.integer :drive_time_left_ms
      t.integer :shift_time_left_ms
      t.integer :cycle_time_left_ms
      t.integer :duty_status, default: 0
      t.integer :shift_violation_ms
      t.integer :cycle_violation_ms

      t.timestamps
    end
  end
end
