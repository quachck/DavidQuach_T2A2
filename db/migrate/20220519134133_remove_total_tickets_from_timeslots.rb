class RemoveTotalTicketsFromTimeslots < ActiveRecord::Migration[7.0]
  def change
    remove_column :timeslots, :total_tickets, :string
  end
end
