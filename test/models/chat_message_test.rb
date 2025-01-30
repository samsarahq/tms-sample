# == Schema Information
#
# Table name: chat_messages
#
#  id          :integer          not null, primary key
#  body        :string           default(""), not null
#  read        :boolean          default(FALSE), not null
#  sender_name :string
#  sender_type :string
#  sent_at     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  driver_id   :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_chat_messages_on_driver_id  (driver_id)
#  index_chat_messages_on_user_id    (user_id)
#
# Foreign Keys
#
#  driver_id  (driver_id => drivers.id)
#  user_id    (user_id => users.id)
#
require "test_helper"

class ChatMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
