class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :samsara_id
      t.string :phone_number
      t.integer :status

      t.timestamps
    end
  end
end
