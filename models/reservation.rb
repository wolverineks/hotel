class Reservation
  attr_accessor :start_date, :end_date, :guest, :room

  @@count = 0
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

  def add_to_guest_and_room(guest:, room:)
    room.guests << guest
    guest.rooms << room
    guest.reservations << self
    room.reservations << self
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

end
