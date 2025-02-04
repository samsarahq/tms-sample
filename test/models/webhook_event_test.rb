# == Schema Information
#
# Table name: webhook_events
#
#  id                :integer          not null, primary key
#  event_type        :string
#  payload           :json             not null
#  processing_errors :text
#  source            :string           not null
#  status            :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class WebhookEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
