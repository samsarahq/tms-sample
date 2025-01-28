# == Schema Information
#
# Table name: drivers
#
#  id           :integer          not null, primary key
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
#  user_id  (user_id => users.id)
#

class Driver < ApplicationRecord
  belongs_to :user

  validates :name, :username, :password, :phone_number, presence: true
  has_one :hours_of_service_clock, dependent: :destroy

  phony_normalize :phone_number, default_country_code: 'US'

  enum :status, { active: 0, deactivated: 1 }

  def clocks
    if hours_of_service_clock.nil?
      clock = HoursOfServiceClock.new(driver: self)
    else
      clock = hours_of_service_clock
    end

    if clock.updated_at.nil? || clock.updated_at < 1.hour.ago
      hos = Samsara::Client.new(user).driver_clocks(samsara_id).first
      clocks = hos.fetch("clocks", {})
      clock.update!(
        time_until_break_ms: clocks.dig("break", "timeUntilBreakDurationMs"),
        drive_time_left_ms: clocks.dig("drive", "driveRemainingDurationMs"),
        shift_time_left_ms: clocks.dig("shift", "shiftRemainingDurationMs"),
        cycle_time_left_ms: clocks.dig("cycle", "cycleRemainingDurationMs"),
        duty_status: hos.dig("currentDutyStatus", "hosStatusType"),
        shift_violation_ms: hos.dig("violations", "shiftDrivingViolationDurationMs"),
        cycle_violation_ms: hos.dig("violations", "cycleViolationDurationMs")
      )
      update!(hours_of_service_clock: clock)
    end

    clock
  end
end

