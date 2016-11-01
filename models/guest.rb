class Guest
  require './models/reservation.rb'

  attr_accessor :first_name, :last_name, :full_name, :reservations, :rooms

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize(args)
    @first_name = args[:first_name]
    @last_name  = args[:last_name]
    @reservations = []
    @rooms = []
    @@count += 1
    @@all << self
    @id = self.class.count
  end

  # Simple full name concatenation
  def full_name
    first_name + " " + last_name
  end

  # Create reservation, add reservation and rooms to instance's reservations and rooms
  def reserve(room:, start_date:, end_date:)
    reservation =
      Reservation.new(
        guest: self,
        room: room,
        start_date: start_date,
        end_date: end_date
      )
    reservations << reservation
    rooms << room

    reservation
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
