require_relative('./guest.rb')
require_relative('./room.rb')
require_relative('./song.rb')

guest1 = Guest.new("Jimmy", 15.00, "Smell's like teen spirit")
guest2 = Guest.new("Mike", 17.00, "My Heart Will Go On")
guest3 = Guest.new("Andy", 20.00, "Master of Puppets")
guest4 = Guest.new("Bob", 10.00, "The Final Countdown")
guest5 = Guest.new("Sandra", 50.00, "Reign in Blood")
guest6 = Guest.new("Jenny", 80.00, "Shout")

song1 = Song.new("Master of Puppets", "Metallica")
song2 = Song.new("My Heart Will Go On", "Celine Dion")
song3 = Song.new("Smells like teen spirit", "Nirvana")

room1 = Room.new("Rock Room", [], [])
room2 = Room.new("Hip-Hop Room",[guest2, guest3],[song2])
room3 = Room.new("Disco Room",[guest2, guest3, guest4, guest5],[])


puts "Hello! Welcome to Codeclan Karaoake. What's your name?"

name = gets.chomp

puts "What's your favourite song?"

song = gets.chomp

player = Guest.new(name, 50, song)
puts "You have £#{player.wallet}"

puts "Which room would you like to go in? It cost's £5 to enter? Rock Room, Hip-Hop Room or Disco Room. Please write your answer."

room = gets.chomp

if room == room1.room_name
  room1.check_in(player)
end

puts "Welcome to the Rock Room. You have £#{player.wallet}"

puts "Which song would you like to listen to? Master of puppets. It costs £2 to sing"

player_song = gets.chomp

if player_song == song1.song_name
  room1.play_song(song1, player)
end

puts "Good choice. You have £#{player.wallet}"
