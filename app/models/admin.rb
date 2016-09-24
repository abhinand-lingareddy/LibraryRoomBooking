class Admin < ActiveRecord::Base
  validates :email, :presence => true, format: { with: /[a-z 0-9]*@[a-z 0-9]*/, message: "only allows valid email accounts" }
  validates :name, :presence => true
  validates :password, :presence => true, length: {minimum: 6}
end
