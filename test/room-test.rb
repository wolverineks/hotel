require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Room Tests'

require 'basic_test'
include BasicTest

require "./factories/factory.rb"
include Factory

require "./models/guest.rb"
require "./models/reservation.rb"
require "./models/room.rb"

test "Room.count",
  expected = 0,
  actual   = Room.count

test "Room.all, when no rooms exist",
  expected = [],
  actual   = Room.all

test "Room.count",
  expected = 1,
  actual   = (
    create_room
    Room.count
  )

test "Room.all, when no rooms exist",
  expected = true,
  actual   = (Room.all).any?

test "Room.all, when rooms exist",
  expected = true,
  actual   = (
    room = create_room
    rooms = Room.all
    rooms.include?(room)
  )

test "room.reservations, with no reservations",
  expected = [],
  actual   = (
    room = create_room
    room.reservations
  )

test "room.guests, with no reservations",
  expected = [],
  actual   = (
    room = create_room
    room.guests
  )

test "room.reservations, with reservations",
  expected = true,
  actual   = (
    guest, room, reservation = create_trio
    room.reservations.include?(reservation)
  )

test "room.guests, with reservations",
  expected = true,
  actual   = (
    guest, room, reservation = create_trio
    room.guests.include?(guest)
  )

#### Tests methods used for checking room availablility ######################

# Check the availablility of a room that has a reservation after the desired date range
test "room.available, when available",
  expected = true,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 10, end_date: DateTime.now + 15)
  )

# Check the availablility of a room that has a reservation before the desired date range
test "room.available, when available",
  expected = true,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 150, end_date: DateTime.now + 160)
  )

# Check the availablility of a room for a desired date range that overlaps the start of an existing reservation
test "room.available, when not leading conflict",
  expected = false,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 90, end_date: DateTime.now + 105)
)

# Check the availablility of a room for a desired date range that overlaps the end of an existing reservation
test "room.available, when not trailing conflict",
  expected = false,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 105, end_date: DateTime.now + 115)
)

# Check the availablility of a room for a desired date range that overlaps both the start and the end of an existing reservation
test "room.available, when not outside conflict",
  expected = false,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 95, end_date: DateTime.now + 115)
)

# Check the availablility of a room for a desired date range that overlaps neither the start nor the end of an existing reservation
test "room.available, when not inside conflict",
  expected = false,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.available?(start_date: DateTime.now + 105, end_date: DateTime.now + 107)
)

# Check the availability of a room using 'booked?' instead of 'available?'
test "room.booked, when booked",
  expected = true,
  actual   = (
    guest, room, reservation =
      create_trio(start_date: DateTime.now + 100, end_date: DateTime.now + 110)
    room.booked?(start_date: DateTime.now + 105, end_date: DateTime.now + 107)
)
