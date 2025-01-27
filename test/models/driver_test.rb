# == Schema Information
#
# Table name: drivers
#
#  id           :integer          not null, primary key
#  name         :string
#  username     :string
#  password     :string
#  samsara_id   :string
#  phone_number :string
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
