# == Schema Information
#
# Table name: form_templates
#
#  id                  :bigint           not null, primary key
#  slug                :string
#  template_json       :json
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  samsara_id          :string
#  samsara_revision_id :string
#  user_id             :integer          not null
#
# Indexes
#
#  index_form_templates_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FormTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
