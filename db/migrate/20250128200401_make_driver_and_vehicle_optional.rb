class MakeDriverAndVehicleOptional < ActiveRecord::Migration[8.0]
  def change
    change_column_null :routes, :driver_id, true
    change_column_null :routes, :vehicle_id, true
  end
end

