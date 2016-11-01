class Reservation
  # getter methods
  attr_reader :id, :guest_id, :room_id, :start_date, :end_date

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize(args)
    # add foreign keys
    @guest_id   = args[:guest_id]
    @room_id    = args[:room_id]

    @start_date = args[:start_date]
    @end_date   = args[:end_date]

    # used for accessing all instances of class
    @@all << self

    # used for setting id of instance
    @@count += 1
    @id = self.class.count
  end

  def guest
    Guest.all.find { |guest| guest.id == guest_id }
  end

  def room
    Room.all.find { |room| room.id == room_id }
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
