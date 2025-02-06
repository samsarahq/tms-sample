# == Schema Information
#
# Table name: form_submissions
#
#  id               :bigint           not null, primary key
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
#  fk_rails_...  (assigned_to_id => drivers.id)
#  fk_rails_...  (form_template_id => form_templates.id)
#  fk_rails_...  (stop_id => stops.id)
#  fk_rails_...  (submitted_by_id => drivers.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FormSubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
