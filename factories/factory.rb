module Factory
  extend self
  require './models/guest.rb'
  require './models/reservation.rb'
  require './models/room.rb'

  def create_guest(first_name: ("A".."z").to_a.sample(5).join, last_name: ("A".."z").to_a.sample(5).join)
    Guest.new(first_name: first_name, last_name: last_name)
  end

  def create_room
    Room.new
  end

  def create_reservation(guest_id:, room_id:, start_date:, end_date:)
    Reservation.new(
      guest_id: guest_id,
      room_id: room_id,
      start_date: start_date,
      end_date: end_date
    )
  end

  def create_trio(guest_id: create_guest.id, room_id: create_room.id, start_date: DateTime.now + 1, end_date: DateTime.now + 2)
    guest = create_guest
    room  = create_room
    reservation = create_reservation(guest_id: guest.id, room_id: room.id, start_date: start_date, end_date: end_date)
    [guest, room, reservation]
  end

end
