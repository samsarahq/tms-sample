require "test_helper"

class StopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stop = stops(:one)
  end

  test "should get index" do
    get stops_url
    assert_response :success
  end

  test "should get new" do
    get new_stop_url
    assert_response :success
  end

  test "should create stop" do
    assert_difference("Stop.count") do
      post stops_url, params: { stop: { actual_arrival_time: @stop.actual_arrival_time, actual_departure_time: @stop.actual_departure_time, address_id: @stop.address_id, en_route_time: @stop.en_route_time, live_sharing_url: @stop.live_sharing_url, notes: @stop.notes, route_id: @stop.route_id, samsara_id: @stop.samsara_id, scheduled_arrival_time: @stop.scheduled_arrival_time, scheduled_departure_time: @stop.scheduled_departure_time, state: @stop.state, stop_type: @stop.stop_type } }
    end

    assert_redirected_to stop_url(Stop.last)
  end

  test "should show stop" do
    get stop_url(@stop)
    assert_response :success
  end

  test "should get edit" do
    get edit_stop_url(@stop)
    assert_response :success
  end

  test "should update stop" do
    patch stop_url(@stop), params: { stop: { actual_arrival_time: @stop.actual_arrival_time, actual_departure_time: @stop.actual_departure_time, address_id: @stop.address_id, en_route_time: @stop.en_route_time, live_sharing_url: @stop.live_sharing_url, notes: @stop.notes, route_id: @stop.route_id, samsara_id: @stop.samsara_id, scheduled_arrival_time: @stop.scheduled_arrival_time, scheduled_departure_time: @stop.scheduled_departure_time, state: @stop.state, stop_type: @stop.stop_type } }
    assert_redirected_to stop_url(@stop)
  end

  test "should destroy stop" do
    assert_difference("Stop.count", -1) do
      delete stop_url(@stop)
    end

    assert_redirected_to stops_url
  end
end
