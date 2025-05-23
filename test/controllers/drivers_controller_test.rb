require "test_helper"

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get drivers_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_url
    assert_response :success
  end

  test "should create driver" do
    assert_difference("Driver.count") do
      post drivers_url, params: { driver: { name: @driver.name, password: @driver.password, phone_number: @driver.phone_number, samsara_id: @driver.samsara_id, status: @driver.status, username: @driver.username } }
    end

    assert_redirected_to driver_url(Driver.last)
  end

  test "should show driver" do
    get driver_url(@driver)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_url(@driver)
    assert_response :success
  end

  test "should update driver" do
    patch driver_url(@driver), params: { driver: { name: @driver.name, password: @driver.password, phone_number: @driver.phone_number, samsara_id: @driver.samsara_id, status: @driver.status, username: @driver.username } }
    assert_redirected_to driver_url(@driver)
  end

  test "should destroy driver" do
    assert_difference("Driver.count", -1) do
      delete driver_url(@driver)
    end

    assert_redirected_to drivers_url
  end
end
