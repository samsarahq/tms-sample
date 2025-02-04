class CreateFormTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :form_templates do |t|
      t.string :samsara_id
      t.string :samsara_revision_id
      t.json :template_json, default: {}
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
