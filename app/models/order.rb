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
class Order < ApplicationRecord
  belongs_to :from_location, class_name: "Location", foreign_key: :from_location_id
  belongs_to :to_location, class_name: "Location", foreign_key: :to_location_id
  belongs_to :user
  has_many :order_stops
  has_many :stops, through: :order_stops

  enum :status, {
    planned: 0,
    dispatched: 1,
    started: 2,
    completed: 3
  }
end
