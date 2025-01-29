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
class Stop < ApplicationRecord
  belongs_to :route
  belongs_to :location
  has_many :order_stops
  has_many :orders, through: :order_stops

  enum :state, {
    unassigned: 0,
    scheduled: 1,
    en_route: 2,
    skipped: 3,
    arrived: 4,
    departed: 5
  }

  def full_notes
    # Include the Order IDs of which orders are
    # being picked up or delivered at this stop:
    "#{notes}\n#{order_stops.map { |os| "#{os.stop_type.titleize} of Order ##{os.order.id}" }.join("\n")}"
  end
end
