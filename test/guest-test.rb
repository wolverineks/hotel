require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Guest Tests'

require 'basic_test'
include BasicTest

require "./factories/factory.rb"
include Factory

require "./models/guest.rb"
require "./models/room.rb"
require "./models/reservation.rb"

test "Guest.count",
  expected = 0,
  actual   = Guest.count

test "Guest.all, when no guests exist",
  expected = [],
  actual   = Guest.all

test "Guest.count",
  expected = 1,
  actual   = (
    create_guest
    Guest.count
  )

test "Guest.all, when no guests exist",
  expected = true,
  actual   = (Guest.all).any?

test "Guest.all, when guests exist",
  expected = true,
  actual   = (
    guest = create_guest
    guests = Guest.all
    guests.include?(guest)
  )

test "guest.first_name",
  expected = "Bill",
  actual   = (
    guest = create_guest(first_name: "Bill", last_name: "Bailey")
    guest.first_name
  )

test "guest.last_name",
  expected = "Bailey",
  actual   = (
    guest = create_guest(first_name: "Bill", last_name: "Bailey")
    guest.last_name
  )

test "guest.full_name",
  expected = "Bill Bailey",
  actual   = (
    guest = create_guest(first_name: "Bill", last_name: "Bailey")
    guest.full_name
  )

test "guest.reservations, with no reservations",
  expected = [],
  actual   = guest.reservations

test "guest.reservations.count, with no reservations",
  expected = 0,
  actual   = (guest.reservations).count

test "guest.rooms, with no reservations",
  expected = [],
  actual   = guest.rooms

test "guest.rooms.count, with no reservations",
  expected = 0,
  actual   = guest.rooms.count

test "guest.reserve(room)",
  expected = Reservation,
  actual   = (
    guest = create_guest
    room  = create_room
    guest.reserve(room: room, start_date: DateTime.now + 1, end_date: DateTime.now + 2).class
  )

test "guest.reservations, with reservations",
  expected = true,
  actual   = (
    guest = create_guest
    room  = create_room
    reservation = guest.reserve(room: room, start_date: DateTime.now + 1, end_date: DateTime.now + 2)

    guest.reservations.first == reservation
  )

test "guest.rooms, with reservations",
  expected = true,
  actual   = (
    guest = create_guest
    room  = create_room
    guest.reserve(room: room, start_date: DateTime.now + 1, end_date: DateTime.now + 2)

    guest.rooms.first == room
  )
