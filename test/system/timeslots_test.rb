require "application_system_test_case"

class TimeslotsTest < ApplicationSystemTestCase
  setup do
    @timeslot = timeslots(:one)
  end

  test "visiting the index" do
    visit timeslots_url
    assert_selector "h1", text: "Timeslots"
  end

  test "should create timeslot" do
    visit timeslots_url
    click_on "New timeslot"

    fill_in "Available tickets", with: @timeslot.available_tickets
    fill_in "Day", with: @timeslot.day
    fill_in "End time", with: @timeslot.end_time
    fill_in "Price", with: @timeslot.price
    fill_in "Start time", with: @timeslot.start_time
    fill_in "Total tickets", with: @timeslot.total_tickets
    fill_in "Workshop", with: @timeslot.workshop_id
    click_on "Create Timeslot"

    assert_text "Timeslot was successfully created"
    click_on "Back"
  end

  test "should update Timeslot" do
    visit timeslot_url(@timeslot)
    click_on "Edit this timeslot", match: :first

    fill_in "Available tickets", with: @timeslot.available_tickets
    fill_in "Day", with: @timeslot.day
    fill_in "End time", with: @timeslot.end_time
    fill_in "Price", with: @timeslot.price
    fill_in "Start time", with: @timeslot.start_time
    fill_in "Total tickets", with: @timeslot.total_tickets
    fill_in "Workshop", with: @timeslot.workshop_id
    click_on "Update Timeslot"

    assert_text "Timeslot was successfully updated"
    click_on "Back"
  end

  test "should destroy Timeslot" do
    visit timeslot_url(@timeslot)
    click_on "Destroy this timeslot", match: :first

    assert_text "Timeslot was successfully destroyed"
  end
end
