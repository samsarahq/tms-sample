# == Schema Information
#
# Table name: stops
#
#  id                       :integer          not null, primary key
#  actual_arrival_time      :datetime
#  actual_departure_time    :datetime
#  en_route_time            :datetime
#  live_sharing_url         :string
#  notes                    :text
#  scheduled_arrival_time   :datetime
#  scheduled_departure_time :datetime
#  state                    :integer          default("unassigned")
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  location_id              :integer          not null
#  route_id                 :integer          not null
#  samsara_id               :string
#
# Indexes
#
#  index_stops_on_location_id  (location_id)
#  index_stops_on_route_id     (route_id)
#
# Foreign Keys
#
#  location_id  (location_id => locations.id)
#  route_id     (route_id => routes.id)
#
require "test_helper"

class StopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
