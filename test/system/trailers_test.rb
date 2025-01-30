require "application_system_test_case"

class TrailersTest < ApplicationSystemTestCase
  setup do
    @trailer = trailers(:one)
  end

  test "visiting the index" do
    visit trailers_url
    assert_selector "h1", text: "Trailers"
  end

  test "should create trailer" do
    visit trailers_url
    click_on "New trailer"

    fill_in "License plate", with: @trailer.license_plate
    fill_in "Make", with: @trailer.make
    fill_in "Model", with: @trailer.model
    fill_in "Name", with: @trailer.name
    fill_in "Notes", with: @trailer.notes
    fill_in "Vin", with: @trailer.vin
    fill_in "Year", with: @trailer.year
    click_on "Create Trailer"

    assert_text "Trailer was successfully created"
    click_on "Back"
  end

  test "should update Trailer" do
    visit trailer_url(@trailer)
    click_on "Edit this trailer", match: :first

    fill_in "License plate", with: @trailer.license_plate
    fill_in "Make", with: @trailer.make
    fill_in "Model", with: @trailer.model
    fill_in "Name", with: @trailer.name
    fill_in "Notes", with: @trailer.notes
    fill_in "Vin", with: @trailer.vin
    fill_in "Year", with: @trailer.year
    click_on "Update Trailer"

    assert_text "Trailer was successfully updated"
    click_on "Back"
  end

  test "should destroy Trailer" do
    visit trailer_url(@trailer)
    click_on "Destroy this trailer", match: :first

    assert_text "Trailer was successfully destroyed"
  end
end
