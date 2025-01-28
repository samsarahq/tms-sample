# == Schema Information
#
# Table name: order_stops
#
#  id         :integer          not null, primary key
#  stop_type  :integer          default("pickup")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer          not null
#  stop_id    :integer          not null
#
# Indexes
#
#  index_order_stops_on_order_id  (order_id)
#  index_order_stops_on_stop_id   (stop_id)
#
# Foreign Keys
#
#  order_id  (order_id => orders.id)
#  stop_id   (stop_id => stops.id)
#
require "test_helper"

class OrderStopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
