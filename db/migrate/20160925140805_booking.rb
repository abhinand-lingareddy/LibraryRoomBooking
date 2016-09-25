class Booking < ActiveRecord::Migration
  def change
    add_index :booking, [:endtime, :date, :room_id], :unique => true
  end
end
