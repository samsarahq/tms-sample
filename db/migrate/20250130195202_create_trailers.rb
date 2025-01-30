class CreateTrailers < ActiveRecord::Migration[8.0]
  def change
    create_table :trailers do |t|
      t.string :name
      t.string :make
      t.string :model
      t.text :notes
      t.string :vin
      t.integer :year
      t.string :license_plate
      t.string :samsara_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
