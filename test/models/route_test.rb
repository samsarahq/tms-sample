# == Schema Information
#
# Table name: routes
#
#  id                   :bigint           not null, primary key
#  actual_end_time      :datetime
#  actual_start_time    :datetime
#  name                 :string
#  scheduled_end_time   :datetime
#  scheduled_start_time :datetime
#  settings             :json
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  driver_id            :integer
#  samsara_id           :string
#  user_id              :integer          not null
#  vehicle_id           :integer
#
# Indexes
#
#  index_routes_on_driver_id   (driver_id)
#  index_routes_on_user_id     (user_id)
#  index_routes_on_vehicle_id  (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (driver_id => drivers.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vehicle_id => vehicles.id)
#
require "test_helper"

class RouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
