class AddFieldsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :timeslot_id, :integer
    add_column :bookings, :instructor_id, :integer
    add_column :bookings, :attendee_id, :integer
  end
end
