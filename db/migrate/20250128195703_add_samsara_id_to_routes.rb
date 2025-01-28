class AddSamsaraIdToRoutes < ActiveRecord::Migration[8.0]
  def change
    add_column :routes, :samsara_id, :string

  end
end
