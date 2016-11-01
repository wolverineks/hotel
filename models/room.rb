class Room
  require "./models/guest.rb"
  require "./models/reservation.rb"

  # getter method
  attr_reader :id

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize()
    # used for accessing all instances of class
    @@all << self

    # used for setting id of instance
    @@count += 1
    @id = self.class.count
  end

  # Array of all reservations associated with an instance of class
  def reservations
    Reservation.all.find_all { |reservation| reservation.room_id == id }
  end

  # Array of guest ids associated with associated reservations
  def guest_ids
    reservations.map { |reservation| reservation.guest_id }
  end

  # Array of guests associated with associated reservations
  def guests
    Guest.all.find_all { |guest| guest_ids.include?(guest.id) }
  end

  # Iterate through all of the rooms reservations, and check if there is any overlap
  def available?(start_date:, end_date:)
    !reservations.any? { |r| r.start_date <= end_date && r.end_date >= start_date }
  end

  # The inverse of available?
  def booked?(start_date:, end_date:)
    !available?(start_date: start_date, end_date: end_date)
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
