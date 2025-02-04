# == Schema Information
#
# Table name: form_submissions
#
#  id               :integer          not null, primary key
#  status           :integer          default("toDo")
#  submission_json  :json
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  assigned_to_id   :integer
#  form_template_id :integer
#  samsara_id       :string
#  stop_id          :integer
#  submitted_by_id  :integer
#  user_id          :integer          not null
#
# Indexes
#
#  index_form_submissions_on_assigned_to_id    (assigned_to_id)
#  index_form_submissions_on_form_template_id  (form_template_id)
#  index_form_submissions_on_stop_id           (stop_id)
#  index_form_submissions_on_submitted_by_id   (submitted_by_id)
#  index_form_submissions_on_user_id           (user_id)
#
# Foreign Keys
#
#  assigned_to_id    (assigned_to_id => drivers.id)
#  form_template_id  (form_template_id => form_templates.id)
#  stop_id           (stop_id => stops.id)
#  submitted_by_id   (submitted_by_id => drivers.id)
#  user_id           (user_id => users.id)
#
require "test_helper"

class FormSubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
