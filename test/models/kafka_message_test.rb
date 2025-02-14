# == Schema Information
#
# Table name: kafka_messages
#
#  id                :bigint           not null, primary key
#  event_type        :string
#  key               :string
#  payload           :json
#  processing_errors :text             default("")
#  topic             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class KafkaMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
