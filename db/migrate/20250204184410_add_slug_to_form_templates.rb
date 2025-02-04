class AddSlugToFormTemplates < ActiveRecord::Migration[8.0]
  def change
    add_column :form_templates, :slug, :string
  end
end
