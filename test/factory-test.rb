require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Factory Tests'

require 'basic_test'
include BasicTest

require "./factories/factory.rb"
include Factory

require "./models/guest.rb"
require "./models/room.rb"
require "./models/reservation.rb"

test "Factory.create_guest",
  expected = Guest,
  actual   = (create_guest).class

test "Factory.create_room",
  expected = Room,
  actual   = (create_room).class

test "Factory.trio",
  expected = Array,
  actual   = (create_trio).class

test "Factory.trio",
  expected = Guest,
  actual   = (create_trio)[0].class

test "Factory.trio",
  expected = Room,
  actual   = (create_trio)[1].class

test "Factory.trio",
  expected = Reservation,
  actual   = (create_trio)[2].class
