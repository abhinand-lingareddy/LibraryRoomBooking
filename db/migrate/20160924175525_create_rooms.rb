class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :roomnumber
      t.integer :buildingname
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
