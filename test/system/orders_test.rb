require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Description", with: @order.description
    fill_in "From location", with: @order.from_location_id
    fill_in "Requested delivery at", with: @order.requested_delivery_at
    fill_in "Requested pickup at", with: @order.requested_pickup_at
    fill_in "Status", with: @order.status
    fill_in "To location", with: @order.to_location_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Description", with: @order.description
    fill_in "From location", with: @order.from_location_id
    fill_in "Requested delivery at", with: @order.requested_delivery_at.to_s
    fill_in "Requested pickup at", with: @order.requested_pickup_at.to_s
    fill_in "Status", with: @order.status
    fill_in "To location", with: @order.to_location_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
