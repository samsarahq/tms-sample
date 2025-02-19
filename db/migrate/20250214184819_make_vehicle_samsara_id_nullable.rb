class MakeVehicleSamsaraIdNullable < ActiveRecord::Migration[8.0]
  def change
    change_column_null :vehicles, :samsara_id, true
  end
end
