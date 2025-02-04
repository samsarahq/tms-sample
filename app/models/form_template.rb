# == Schema Information
#
# Table name: form_templates
#
#  id                  :integer          not null, primary key
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
#  user_id  (user_id => users.id)
#
class FormTemplate < ApplicationRecord
  belongs_to :user

  has_many :form_submissions, dependent: :destroy

  validates :slug, presence: true, uniqueness: { scope: :user_id }
end

