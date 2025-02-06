# == Schema Information
#
# Table name: chat_messages
#
#  id          :bigint           not null, primary key
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
#  fk_rails_...  (driver_id => drivers.id)
#  fk_rails_...  (user_id => users.id)
#
class ChatMessage < ApplicationRecord
  belongs_to :driver
  belongs_to :user
end
