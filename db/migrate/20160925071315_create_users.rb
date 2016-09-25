class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end

    User.create(:email=>"admin@ncsu.edu", :name=>"SuperAdmin", :password=>"123", :admin=>true)
  end
end
