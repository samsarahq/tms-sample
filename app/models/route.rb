# == Schema Information
#
# Table name: routes
#
#  id                   :integer          not null, primary key
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
#  driver_id   (driver_id => drivers.id)
#  user_id     (user_id => users.id)
#  vehicle_id  (vehicle_id => vehicles.id)
#
class Route < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :vehicle, optional: true
  belongs_to :user

  has_many :stops, dependent: :destroy
end