require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../room.rb')


class TestRoom < Minitest::Test

  def setup

    @room1 = Room.new("Rock Room", [], [])
    @room2 = Room.new("Hip-Hop Room",[@guest2, @guest3],[@song2])
    @room3 = Room.new("Disco Room",[@guest2, @guest3, @guest4, @guest5],[])

    @guest1 = Guest.new("Jimmy", 15.00, "Smell's like teen spirit")
    @guest2 = Guest.new("Mike", 17.00, "My Heart Will Go On")
    @guest3 = Guest.new("Andy", 20.00, "Master of Puppets")
    @guest4 = Guest.new("Bob", 10.00, "The Final Countdown")
    @guest5 = Guest.new("Sandra", 50.00, "Reign in Blood")
    @guest6 = Guest.new("Jenny", 80.00, "Shout")

    @song1 = Song.new("Master of Puppets", "Metallica")
    @song2 = Song.new("My Heart Will Go On", "Celine Dion")
    @song3 = Song.new("Smells like teen spirit", "Nirvana")

  end

  def test_room_name
    assert_equal("Rock Room", @room1.room_name)
  end

  def test_room_capacity
    @room2.capacity()
    assert_equal(2, @room2.capacity())
  end

  def test_check_in
    @room1.check_in(@guest1)
    assert_equal(1, @room1.capacity)
  end

  def test_check_out
    @room2.check_out
    assert_equal(1, @room2.capacity())
  end

  def test_play_song__favourite_song
    assert_equal("My Heart Will Go On now playing. My Heart Will Go On is Mike's favourite song", @room3.play_song(@song2, @guest2))
  end

  def test_play_song__not_favourite_song
    assert_equal("My Heart Will Go On now playing.", @room3.play_song(@song2, @guest4))
  end

  def test_song_already_playing
    assert_equal("Song already playing", @room2.play_song(@song2, @guest2))
  end

  def test_stop_song
    assert_equal("Song stopped", @room2.stop_song)
  end

  def test_room_at_full_capacity
    @room3.check_in(@guest1)
    assert_equal(5, @room3.capacity)
    @room3.check_in(@guest6)
    assert_equal("Room at full capacity. Please come back later", @room3.check_in(@guest6))
  end

  def test_karaoke_price
    @room1.check_in(@guest1)
    assert_equal(10.00, @guest1.wallet)
  end

  def test_favourite_song
    assert_equal(@room3.favourite_song(@guest2,@song2), "FUCK YEAH! I LOVE THIS SONG!")
  end

end
