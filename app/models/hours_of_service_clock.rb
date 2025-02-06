# == Schema Information
#
# Table name: hours_of_service_clocks
#
#  id                  :bigint           not null, primary key
#  cycle_time_left_ms  :integer
#  cycle_violation_ms  :integer
#  drive_time_left_ms  :integer
#  duty_status         :integer          default("offDuty")
#  shift_time_left_ms  :integer
#  shift_violation_ms  :integer
#  time_until_break_ms :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  driver_id           :integer          not null
#
# Indexes
#
#  index_hours_of_service_clocks_on_driver_id  (driver_id)
#
# Foreign Keys
#
#  fk_rails_...  (driver_id => drivers.id)
#
class HoursOfServiceClock < ApplicationRecord
  belongs_to :driver

  enum :duty_status, {
    offDuty: 0,
    sleeperBed: 1,
    driving: 2,
    onDuty: 3,
    yardMove: 4,
    personalConveyance: 5
  }
end
