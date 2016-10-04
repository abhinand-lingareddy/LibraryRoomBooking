class Room < ActiveRecord::Base
  has_many :bookings, :dependent => :delete_all
  validates :roomnumber, :presence => true, uniqueness: true,:numericality => {:only_integer => true}
  enum buildingname: [ :hunt, :hill ]
  enum capacity: [ :small, :medium, :large ]

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
