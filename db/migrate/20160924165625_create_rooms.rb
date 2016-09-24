class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :RoomNumber
      t.integer :BuildingName
      t.integer :Capacity

      t.timestamps null: false
    end
  end
end
