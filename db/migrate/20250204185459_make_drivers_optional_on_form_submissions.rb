class MakeDriversOptionalOnFormSubmissions < ActiveRecord::Migration[8.0]
  def change
    change_column_null :form_submissions, :submitted_by_id, true
    change_column_null :form_submissions, :assigned_to_id, true
  end
end

