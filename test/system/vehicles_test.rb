require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "should create vehicle" do
    visit vehicles_url
    click_on "New vehicle"

    fill_in "Latitude", with: @vehicle.latitude
    fill_in "Longitude", with: @vehicle.longitude
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "Name", with: @vehicle.name
    fill_in "Notes", with: @vehicle.notes
    fill_in "Samsara", with: @vehicle.samsara_id
    fill_in "User", with: @vehicle.user_id
    fill_in "Vin", with: @vehicle.vin
    fill_in "Year", with: @vehicle.year
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "should update Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Edit this vehicle", match: :first

    fill_in "Latitude", with: @vehicle.latitude
    fill_in "Longitude", with: @vehicle.longitude
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "Name", with: @vehicle.name
    fill_in "Notes", with: @vehicle.notes
    fill_in "Samsara", with: @vehicle.samsara_id
    fill_in "User", with: @vehicle.user_id
    fill_in "Vin", with: @vehicle.vin
    fill_in "Year", with: @vehicle.year
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Destroy this vehicle", match: :first

    assert_text "Vehicle was successfully destroyed"
  end
end
