load "./models/all.rb"

puts "----- Demo for Hotel -----"

puts "Creating new guest..."
guest = create_guest
sleep 1
puts "Guest: #{guest}"
sleep 1

puts "Creating new room..."
room = create_room
sleep 1
puts "Room: #{room}"
sleep 1

puts "Reserving room: #{room.id} for guest: #{guest.id}..."
start_date = DateTime.now
end_date = start_date + 10

reservation =
  create_reservation(
    guest_id: guest.id,
    room_id: room.id,
    start_date: start_date,
    end_date: end_date
  )
sleep 1

puts "Testing no conflict (before)..."
sleep 1
result = room.available?(start_date: start_date - 5, end_date: start_date - 2)
puts "The room is #{ result ? "available." : "booked." }"
sleep 1

puts "Testing no conflict (after)..."
sleep 1
result = room.available?(start_date: end_date + 5, end_date: end_date + 10)
puts "The room is #{ result ? "available." : "booked." }"
sleep 1

puts "Testing leading conflict..."
sleep 1
result = room.available?(start_date: start_date - 5, end_date: start_date + 5)
puts "The room is #{ result ? "available." : "booked." }"
sleep 1

puts "Testing trailing conflict..."
sleep 1
result = room.available?(start_date: start_date + 5, end_date: end_date + 5)
puts "The room is #{ result ? "available." : "booked." }"
sleep 1

puts "Testing inside conflict..."
sleep 1
result = room.available?(start_date: start_date + 1, end_date: end_date - 1)
puts "The room is #{ result ? "available." : "booked." }"
sleep 1

puts "Testing outside conflict..."
sleep 1
result = room.available?(start_date: start_date - 5, end_date: end_date + 5)
puts "The room is #{ result ? "available." : "booked." }"
