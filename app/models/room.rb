class Room < ActiveRecord::Base
  has_many :bookings
  enum buildingname: [ :hunt, :hill ]
  enum capacity: [ :small, :medium, :large ]

  def self.search(field,search)
      where("#{field}": "#{search}")
  end
end
