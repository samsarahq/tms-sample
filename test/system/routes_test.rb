require "application_system_test_case"

class RoutesTest < ApplicationSystemTestCase
  setup do
    @route = routes(:one)
  end

  test "visiting the index" do
    visit routes_url
    assert_selector "h1", text: "Routes"
  end

  test "should create route" do
    visit routes_url
    click_on "New route"

    fill_in "Actual end time", with: @route.actual_end_time
    fill_in "Actual start time", with: @route.actual_start_time
    fill_in "Driver", with: @route.driver_id
    fill_in "Name", with: @route.name
    fill_in "Scheduled end time", with: @route.scheduled_end_time
    fill_in "Scheduled start time", with: @route.scheduled_start_time
    fill_in "Settings", with: @route.settings
    fill_in "User", with: @route.user_id
    fill_in "Vehicle", with: @route.vehicle_id
    click_on "Create Route"

    assert_text "Route was successfully created"
    click_on "Back"
  end

  test "should update Route" do
    visit route_url(@route)
    click_on "Edit this route", match: :first

    fill_in "Actual end time", with: @route.actual_end_time.to_s
    fill_in "Actual start time", with: @route.actual_start_time.to_s
    fill_in "Driver", with: @route.driver_id
    fill_in "Name", with: @route.name
    fill_in "Scheduled end time", with: @route.scheduled_end_time.to_s
    fill_in "Scheduled start time", with: @route.scheduled_start_time.to_s
    fill_in "Settings", with: @route.settings
    fill_in "User", with: @route.user_id
    fill_in "Vehicle", with: @route.vehicle_id
    click_on "Update Route"

    assert_text "Route was successfully updated"
    click_on "Back"
  end

  test "should destroy Route" do
    visit route_url(@route)
    click_on "Destroy this route", match: :first

    assert_text "Route was successfully destroyed"
  end
end
