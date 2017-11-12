require('pry')
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
song2 = Song.new("Stairway to Heaven", "Led Zeppelin")
song3 = Song.new("Smells like teen spirit", "Nirvana")

song4 = Song.new("Gangsta's Paradise", "Coolio")
song5 = Song.new("Fuck the Police", "N.W.A")
song6 = Song.new("Still D.R.E", "Dr. Dre")

song7 = Song.new("My Heart Will Go On", "Celine Dion")
song8 = Song.new("Hit Me Baby One More Time", "Britney Spears")
song8 = Song.new("Mmmmbop", "Hanson")

rock_songs = [song1, song2, song3]
hip_hop_songs = [song4, song5, song6]
pop_songs = [song5, song6, song7]

room0 = Room.new("Lobby", [], [])
room1 = Room.new("Rock Room", [], [])
room2 = Room.new("Hip Hop Room",[guest2, guest3],[song2])
room3 = Room.new("Pop Room",[guest2, guest3, guest4, guest5],[])

print %x{clear}

puts "Hello! Welcome to Codeclan Karaoake. What's your name?"

name = gets.chomp

puts "What's your favourite song?"

song = gets.chomp

player = Guest.new(name, 50, song)
puts "You have £#{player.wallet}"

puts "It cost's £5 to enter and 5 pound to change room? Type Yes or No"

answer = gets.chomp
answer.capitalize!

if answer == "Yes"
  room0.check_in(player)
else
  puts "Goodbye"
  exit
end

print %x{clear}

puts "Which room would you like to go in? \n Rock Room,\n Hip Hop Room\n Disco Room\n Please write your answer."

until player.wallet == 0


  room = ""
  room = gets.chomp

  if room == room1.room_name
    room1.check_in(player)


    puts "Welcome to the Rock Room. You have £#{player.wallet}\n"
    puts "\n"

    puts "Which song would you like to listen to? It costs £2 to sing. Type leave to return to the Lobby\n"
    puts "\n"

    for song in rock_songs
      puts song.song_name
    end

    player_song = gets.chomp

    if player_song == song1.song_name
      room1.play_song(song1, player)
    elsif player_song == song2.song_name
      room1.play_song(song2, player)
    elsif player_song == song3.song_name
      room1.play_song(song3, player)
    elsif player_song == "Leave"
      room1.check_out
      room0.check_in(player)
    else puts "Sorry that song doesn't exist"
    end

    player.wallet -= 2.00
    puts "Good choice. You have £#{player.wallet}"
    puts "\n"
    puts "Please type Stop when you have finished listening"
    "\n"

    stop = gets.chomp
    if stop == 'Stop'
      room1.stop_song
    end

    print %x{clear}

    puts "Thanks. Would you like to change room? Please choose:\n Rock Room \n Hip Hop Room \n Pop Room\n"



  elsif room == room2.room_name
    room2.check_in(player)
    puts "Welcome to the Hip Hop Room. You have £#{player.wallet}"

    puts "Which song would you like to listen to? Master of puppets. It costs £2 to sing"

    player_song = gets.chomp

    if player_song == song1.song_name
      room1.play_song(song1, player)
    end

    puts "Good choice. You have £#{player.wallet}"



  elsif room == room3.room_name
    room3.check_in(player)
    puts "Welcome to the Pop Room. You have £#{player.wallet}"

    puts "Which song would you like to listen to? Master of puppets. It costs £2 to sing"

    player_song = gets.chomp

    if player_song == song1.song_name
      room1.play_song(song1, player)
    end

end
  puts "Good choice. You have £#{player.wallet}"
  # puts "Sorry ßthat room doesn't exit"
  # exit
end
