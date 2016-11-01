require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Reservation Tests'

require 'basic_test'
include BasicTest

require "./factories/factory.rb"
include Factory

require "./models/guest.rb"
require "./models/reservation.rb"
require "./models/room.rb"

test "Reservation.count",
  expected = 0,
  actual   = Reservation.count

test "Reservation.all, when no reservations exist",
  expected = [],
  actual   = Reservation.all

test "Reservation.count",
  expected = 1,
  actual   = (
    create_trio
    Reservation.count
  )

test "Reservation.all, when no reservations exist",
  expected = true,
  actual   = (Reservation.all).any?

test "Reservation.all, when reservations exist",
  expected = true,
  actual   = (
    guest_id, room_id, reservation = create_trio
    reservations = Reservation.all
    reservations.include?(reservation)
  )

test "reservation.start_date",
  expected = DateTime,
  actual   = (
    guest, room, reservation = create_trio
    reservation.start_date.class
  )

test "reservation.end_date",
  expected = DateTime,
  actual   = (
    guest, room, reservation = create_trio
    reservation.end_date.class
  )

test "reservation.guest",
  expected = true,
  actual   = (
    guest, room, reservation = create_trio
    reservation.guest.id == guest.id
  )

test "reservation.room",
  expected = true,
  actual   = (
    guest, room, reservation = create_trio
    reservation.room.id == room.id
  )
