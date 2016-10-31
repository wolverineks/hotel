class Room
  attr_accessor :id, :reservations, :guests

  # Count of all instances of class, also used for instance ID
  @@count = 0
  # Array of all instances of class
  @@all   = []

  def initialize()
    @reservations = []
    @guests = []
    @@count += 1
    @@all << self
    @id = self.class.count
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
