require "application_system_test_case"

class StopsTest < ApplicationSystemTestCase
  setup do
    @stop = stops(:one)
  end

  test "visiting the index" do
    visit stops_url
    assert_selector "h1", text: "Stops"
  end

  test "should create stop" do
    visit stops_url
    click_on "New stop"

    fill_in "Actual arrival time", with: @stop.actual_arrival_time
    fill_in "Actual departure time", with: @stop.actual_departure_time
    fill_in "Address", with: @stop.address_id
    fill_in "En route time", with: @stop.en_route_time
    fill_in "Live sharing url", with: @stop.live_sharing_url
    fill_in "Notes", with: @stop.notes
    fill_in "Route", with: @stop.route_id
    fill_in "Samsara", with: @stop.samsara_id
    fill_in "Scheduled arrival time", with: @stop.scheduled_arrival_time
    fill_in "Scheduled departure time", with: @stop.scheduled_departure_time
    fill_in "State", with: @stop.state
    fill_in "Stop type", with: @stop.stop_type
    click_on "Create Stop"

    assert_text "Stop was successfully created"
    click_on "Back"
  end

  test "should update Stop" do
    visit stop_url(@stop)
    click_on "Edit this stop", match: :first

    fill_in "Actual arrival time", with: @stop.actual_arrival_time.to_s
    fill_in "Actual departure time", with: @stop.actual_departure_time.to_s
    fill_in "Address", with: @stop.address_id
    fill_in "En route time", with: @stop.en_route_time.to_s
    fill_in "Live sharing url", with: @stop.live_sharing_url
    fill_in "Notes", with: @stop.notes
    fill_in "Route", with: @stop.route_id
    fill_in "Samsara", with: @stop.samsara_id
    fill_in "Scheduled arrival time", with: @stop.scheduled_arrival_time.to_s
    fill_in "Scheduled departure time", with: @stop.scheduled_departure_time.to_s
    fill_in "State", with: @stop.state
    fill_in "Stop type", with: @stop.stop_type
    click_on "Update Stop"

    assert_text "Stop was successfully updated"
    click_on "Back"
  end

  test "should destroy Stop" do
    visit stop_url(@stop)
    click_on "Destroy this stop", match: :first

    assert_text "Stop was successfully destroyed"
  end
end
