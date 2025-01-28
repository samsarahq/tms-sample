# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  event_type        :string
#  payload           :json
#  processing_errors :text
#  source            :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_id          :string
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
