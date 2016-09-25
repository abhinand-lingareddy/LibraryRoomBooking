class CreateBookings < ActiveRecord::Migration
  create_table :bookings do |t|
    t.belongs_to :user, index: true
    t.belongs_to :room, index: true
    t.integer :endtime
    t.date :date

    t.timestamps null: false
  end
  def change
    add_index :bookings, [:endtime, :date, :room_id], :unique => true
  end
end
