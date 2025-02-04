class CreateFormSubmissions < ActiveRecord::Migration[8.0]
  def change
    add_column :form_templates, :title, :string

    create_table :form_submissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :form_template, null: true, foreign_key: true
      t.string :samsara_id
      t.references :submitted_by, null: false, foreign_key: { to_table: :drivers }
      t.integer :status, default: 0
      t.references :assigned_to, null: false, foreign_key: { to_table: :drivers }
      t.references :stop, null: true, foreign_key: true
      t.json :submission_json, default: {}

      t.timestamps
    end
  end
end
