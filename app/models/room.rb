class Room < ActiveRecord::Base
  has_many :bookings
  enum buildingname: [ :hunt, :hill ]
  enum capacity: [ :small, :meduim, :large ]

  def self.search(field,search)
    if field=="buildingname"
      search=Room.buildingnames[search]
    end
    if field=="capacity"
      search=Room.capacities[search]
    end
      where("#{field}": "#{search}")
  end
end
