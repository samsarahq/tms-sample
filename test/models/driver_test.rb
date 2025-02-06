# == Schema Information
#
# Table name: drivers
#
#  id           :bigint           not null, primary key
#  name         :string
#  password     :string
#  phone_number :string
#  status       :integer
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  samsara_id   :string
#  user_id      :integer
#
# Indexes
#
#  index_drivers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require "test_helper"

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
