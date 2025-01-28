# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  description           :text
#  requested_delivery_at :datetime
#  requested_pickup_at   :datetime
#  status                :integer          default("planned")
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  from_location_id      :integer          not null
#  to_location_id        :integer          not null
#  user_id               :integer          not null
#
# Indexes
#
#  index_orders_on_from_location_id  (from_location_id)
#  index_orders_on_to_location_id    (to_location_id)
#  index_orders_on_user_id           (user_id)
#
# Foreign Keys
#
#  from_location_id  (from_location_id => locations.id)
#  to_location_id    (to_location_id => locations.id)
#  user_id           (user_id => users.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
