class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :samsara_id
      t.string :formatted_address
      t.json :geofence, default: {}
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :locations, :samsara_id, unique: true
  end
end
