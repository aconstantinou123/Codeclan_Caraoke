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
song9 = Song.new("Mmmmbop", "Hanson")

rock_songs = [song1, song2, song3]
hip_hop_songs = [song4, song5, song6]
pop_songs = [song7, song8, song9]

room0 = Room.new("Lobby", [], [])
room1 = Room.new("Rock Room", [], [])
room2 = Room.new("Hip Hop Room",[guest2, guest3],[song2])
room3 = Room.new("Pop Room",[guest2, guest3, guest4, guest5],[])
room4 = Room.new("Bar", [], [])

drinks = [
  {
    name: "Vodka",
    price: 4.50,
    alcohol: 40,
    stock: 5
  },
  {
    name: "Beer",
    price: 5.00,
    alcohol: 10,
    stock: 5
  },
  {
    name: "Wine",
    price: 7.50,
    alcohol: 15,
    stock: 5
  }
]


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

  puts "Which room would you like to go in? \n Rock Room,\n Hip Hop Room\n Pop Room\n Bar\n Please write your answer."
  puts "\n"

until player.wallet == 0


    room = ""
    room = gets.chomp

  if room == room1.room_name
      room1.check_in(player)


      puts "Welcome to the Rock Room. You have £#{player.wallet}\n"
      puts "\n"

      response = "Yes"

    until response == "No"

      puts "Which song would you like to listen to? It costs £2 to sing. Type leave to return to the Lobby\n"
      puts "\n"

          for song in rock_songs
            puts song.song_name
          end
          puts "\n"

      player_song = gets.chomp

        if player_song == song1.song_name
            room1.play_song(song1, player)
          elsif player_song == song2.song_name
            room1.play_song(song2, player)
          elsif player_song == song3.song_name
            room1.play_song(song3, player)
          elsif player_song == "Leave"
            room2.check_out
            room0.check_in(player)
          else puts "Sorry that song doesn't exist\n"
        end

        player.wallet -= 2.00
        puts "Good choice. You have £#{player.wallet}"
        puts "\n"

        puts "Please type Stop when you have finished listening"
        "\n"

        stop = gets.chomp
        if stop == 'Stop'
          room2.stop_song
        end

        print %x{clear}

        puts"Would you like to listen to another song? Type Yes or No"
        puts "\n"

        response = ""

        response = gets.chomp

    end

        puts "Thanks. Would you like to change room? Please choose:\n Rock Room \n Hip Hop Room \n Pop Room\n Bar\n You can also type Leave to go home\n"
        puts "\n"



    elsif room == room2.room_name
      room2.check_in(player)
      puts "Welcome to the Hip Hop Room. You have £#{player.wallet}\n"
      puts "\n"

      response = "Yes"

      until response == "No"

      puts "Which song would you like to listen to? It costs £2 to sing\n"
      puts "\n"

      for song in  hip_hop_songs
        puts song.song_name
      end
      puts "\n"

      player_song = gets.chomp

      if player_song == song4.song_name
        room1.play_song(song4, player)
        elsif player_song == song5.song_name
          room1.play_song(song5, player)
        elsif player_song == song6.song_name
          room1.play_song(song6, player)
        elsif player_song == "Leave"
          room1.check_out
          room0.check_in(player)
        else puts "Sorry that song doesn't exist\n"
      end

      player.wallet -= 2.00
      puts "Good choice. You have £#{player.wallet}"
      puts "\n"

      puts "Please type Stop when you have finished listening"
      "\n"

      stop = gets.chomp
        if stop == 'Stop'
          room3.stop_song
        end

      print %x{clear}

      puts"Would you like to listen to another song? Type Yes or No"
      puts "\n"

      response = ""

      response = gets.chomp

    end

      puts "Thanks. Would you like to change room? Please choose:\n Rock Room \n Hip Hop Room \n Pop Room\n Bar \n You can also type Leave to go home\n"
      puts "\n"


  elsif room == room3.room_name
      room3.check_in(player)
        puts "Welcome to the Pop Room. You have £#{player.wallet}\n"
        puts "\n"

      response = "Yes"

    until response == "No"

        puts "Which song would you like to listen to? It costs £2 to sing\n"
        puts "\n"

      for song in  pop_songs
        puts song.song_name
      end
      puts "\n"

      player_song = gets.chomp

        if player_song == song7.song_name
          room1.play_song(song7, player)
          elsif player_song == song8.song_name
            room1.play_song(song8, player)
          elsif player_song == song9.song_name
            room1.play_song(song9, player)
          elsif player_song == "Leave"
            room1.check_out
            room0.check_in(player)
          else puts "Sorry that song doesn't exist\n"
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

        puts"Would you like to listen to another song? Type Yes or No"
        puts "\n"

        response = ""

        response = gets.chomp

    end

        puts "Thanks. Would you like to change room? Please choose:\n Rock Room \n Hip Hop Room \n Pop Room\n Bar\n You can also type Leave to go home\n"
        puts "\n"

  elsif room == room4.room_name

    print %x{clear}

    puts "Welcome to the Bar. Please type what you would like to buy"
    puts "\n"

    response = "Yes"

  until player.wallet == 0 || response == "No"

    for drink in drinks
      puts "#{drink[:name]}          #{drink[:price]}"
    end
    puts "\n"

    drink_name = gets.chomp

    "Excellent choice sir"
    for drink in drinks
      if drink_name == drink[:name]
        player.wallet -= drink[:price]
      end
    end
    puts "\n"
    puts player.wallet

    puts "You now have £#{player.wallet} remaining\n"
    puts "Would you like another drink? Type Yes or No"

    response = ""

    response = gets.chomp

    print %x{clear}

  end

    puts "Thanks. Would you like to change room? Please choose:\n Rock Room \n Hip Hop Room \n Pop Room\n Bar\n You can also type Leave to go home\n"
    puts "\n"

  elsif room == "Leave"
    puts "Goodbye"
    exit
  end
end
