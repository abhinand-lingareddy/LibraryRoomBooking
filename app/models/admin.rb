class Admin < ActiveRecord::Base
  attr_reader :email
  validates :email, :presence => true, uniqueness: true
  validates :name, :presence => true
  validates :password, :presence => true

  def self.authenticate(email="", password="")
    admin = Admin.find_by_email(email)
    if admin && admin.password == password
      return admin
    else
      return false
    end
  end
end
