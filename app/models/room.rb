class Room < ActiveRecord::Base
  has_many :bookings
  enum buildingname: [ :hunt, :hill ]
  enum capacity: [ :small, :meduim, :large ]

  def self.search(field,search)
      where("#{field}": "#{search}")
  end
end
