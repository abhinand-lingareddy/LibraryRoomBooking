class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end

       User.create(:email=>"msardar@ncsu.edu", :name=>"Mohit S", :password=>"123", :admin=>true)
  end
end
