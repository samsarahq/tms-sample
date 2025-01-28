class AddUserToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :user, null: false, foreign_key: true
  end
end
