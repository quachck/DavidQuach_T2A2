class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslots do |t|
      t.references :workshop, null: false, foreign_key: true
      t.date :day
      t.time :start_time
      t.time :end_time
      t.integer :price
      t.integer :total_seats
      t.integer :available_seats

      t.timestamps
    end
  end
end
