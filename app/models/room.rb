class Room < ActiveRecord::Base
  has_many :bookings

  def self.search(field,search)
      where("#{field}": "#{search}")
  end
end
