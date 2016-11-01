class Guest
  require './models/reservation.rb'

  # getter methods
  attr_reader :id, :first_name, :last_name, :full_name

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize(args)
    @first_name = args[:first_name]
    @last_name  = args[:last_name]

    # used for accessing all instances of class
    @@all << self

    # used for setting id of instance
    @@count += 1
    @id = self.class.count
  end

  # Simple full name concatenation
  def full_name
    first_name + " " + last_name
  end

  # Create reservation, add reservation and rooms to instance's reservations and rooms
  def reserve(room_id:, start_date:, end_date:)
    Reservation.new(
      guest_id: id,
      room_id: room_id,
      start_date: start_date,
      end_date: end_date
    )
  end

  def reservations
    Reservation.all.find_all { |reservation| reservation.guest_id == id }
  end

  def room_ids
    reservations.map { |reservation| reservation.room_id }
  end

  def rooms
    Room.all.find_all { |room| room_ids.include?(room.id) }
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
