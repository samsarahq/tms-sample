class SamsaraConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      message = KafkaMessage.create!(
        topic: message.topic,
        key: message.key,
        payload: message.payload
      )
      handle_message(message)
    end
  end

  def handle_message(message)
    if message.payload["asset"]
      handle_asset_message(message)
    end
    if message.payload["clocks"]
      handle_clock_message(message)
    end
  end

  def handle_asset_message(message)
    asset = message.payload["asset"]
    vehicle = Vehicle.find_by(samsara_id: asset["id"])
    return if vehicle.nil?

    if message.payload["location"]
      vehicle.update!(
        latitude: message.payload["location"]["latitude"],
        longitude: message.payload["location"]["longitude"]
      )
    end
  end

  def handle_clock_message(message)
    clock = message.payload["clocks"]
    driver = message.payload["driver"]
    violations = message.payload["violations"]
    driver = Driver.find_by(samsara_id: driver["id"])
    return if driver.nil?

    driver.hours_of_service_clock&.update!(
      cycle_time_left_ms: clock["cycle"]["cycleRemainingDurationMs"],
      cycle_violation_ms: violations["cycleViolationDurationMs"],
      drive_time_left_ms: clock["drive"]["driveRemainingDurationMs"],
      duty_status: clock["dutyStatus"],
      shift_time_left_ms: clock["shift"]["shiftRemainingDurationMs"],
      shift_violation_ms: violations["shiftDrivingViolationDurationMs"],
      time_until_break_ms: clock["timeUntilBreakMs"]
    )
  end
end

