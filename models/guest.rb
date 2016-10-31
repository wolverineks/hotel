class Guest
  require './models/reservation.rb'

  attr_accessor :first_name, :last_name, :full_name, :reservations, :rooms

  @@count = 0
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

  def full_name
    first_name + " " + last_name
  end

  def reserve(room:, start_time:, end_time:)
    reservation =
      Reservation.new(
        guest: self,
        room: room,
        start_time: start_time,
        end_time: end_time
      )
    reservations << reservation
    rooms << room

    reservation
  end

  def self.count
    @@count
  end

  def self.all
    @@all
  end

end
