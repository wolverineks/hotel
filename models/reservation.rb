class Reservation
  attr_accessor :id, :start_date, :end_date, :guest, :room

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize(args)
    @guest      = args[:guest]
    @room       = args[:room]
    @start_date = args[:start_date]
    @end_date   = args[:end_date]
    @@count += 1
    @@all << self
    @id = self.class.count
    add_to_guest_and_room(guest: args[:guest], room: args[:room])
  end

  # Associates all 3 instances with each other
  def add_to_guest_and_room(guest:, room:)
    room.guests << guest
    guest.rooms << room
    guest.reservations << self
    room.reservations << self
  end

  # Class method to access total count of class instances
  def self.count
    @@count
  end

  # Class method to access array or all instances of class
  def self.all
    @@all
  end

end
