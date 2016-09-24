class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :admin, index: true
      t.belongs_to :room, index: true
      t.integer :endtime
      t.date :date

      t.timestamps null: false
    end
  end
end