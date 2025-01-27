class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :name
      t.string :year
      t.string :samsara_id
      t.text :notes
      t.string :vin
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :vehicles, :samsara_id, unique: true
    add_reference :drivers, :user, foreign_key: true
  end
end
