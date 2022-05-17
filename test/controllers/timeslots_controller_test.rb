require "test_helper"

class TimeslotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeslot = timeslots(:one)
  end

  test "should get index" do
    get timeslots_url
    assert_response :success
  end

  test "should get new" do
    get new_timeslot_url
    assert_response :success
  end

  test "should create timeslot" do
    assert_difference("Timeslot.count") do
      post timeslots_url, params: { timeslot: { available_seats: @timeslot.available_seats, day: @timeslot.day, end_time: @timeslot.end_time, price: @timeslot.price, start_time: @timeslot.start_time, total_seats: @timeslot.total_seats, workshop_id: @timeslot.workshop_id } }
    end

    assert_redirected_to timeslot_url(Timeslot.last)
  end

  test "should show timeslot" do
    get timeslot_url(@timeslot)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeslot_url(@timeslot)
    assert_response :success
  end

  test "should update timeslot" do
    patch timeslot_url(@timeslot), params: { timeslot: { available_seats: @timeslot.available_seats, day: @timeslot.day, end_time: @timeslot.end_time, price: @timeslot.price, start_time: @timeslot.start_time, total_seats: @timeslot.total_seats, workshop_id: @timeslot.workshop_id } }
    assert_redirected_to timeslot_url(@timeslot)
  end

  test "should destroy timeslot" do
    assert_difference("Timeslot.count", -1) do
      delete timeslot_url(@timeslot)
    end

    assert_redirected_to timeslots_url
  end
end
