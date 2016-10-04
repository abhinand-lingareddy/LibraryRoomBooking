class User < ActiveRecord::Base
  has_many :bookings, :dependent => :delete_all
  validates :email, :presence => true, uniqueness: true
  validates :name, :presence => true


  def self.authenticate(email="", password="")
    user = User.find_by_email(email)
    if user && user.password == password
      return user
    else
      return false
    end
  end
end
