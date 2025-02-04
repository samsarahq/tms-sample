json.extract! form_submission, :id, :user_id, :form_template_id, :samsara_id, :submitted_by_id, :status, :assigned_to_id, :stop_id, :created_at, :updated_at
json.url form_submission_url(form_submission, format: :json)
