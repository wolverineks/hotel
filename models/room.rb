class Room
  attr_accessor :id, :reservations, :guests

  @@count = 0
  @@all   = []

  def initialize()
    @reservations = []
    @guests = []
    @@count += 1
    @@all << self
    @id = self.class.count
  end

  def available?(start_date:, end_date:)
    !reservations.any? { |r| r.start_date <= end_date && r.end_date >= start_date }
  end

  def booked?(start_date:, end_date:)
    !available?(start_date: start_date, end_date: end_date)
  end

  def self.count
    @@count
  end

  def self.all
    @@all
  end

end