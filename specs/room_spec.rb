require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../room.rb')


class TestRoom < Minitest::Test

  def setup

    @room1 = Room.new("Rock Room", [], [])
    @room2 = Room.new("Hip-Hop Room",[@guest2, @guest3],[@song2])
    @room3 = Room.new("Hip-Hop Room",[@guest2, @guest3, @guest4, @guest5],[@song2])

    @guest1 = Guest.new("Jimmy")
    @guest2 = Guest.new("Mike")
    @guest3 = Guest.new("Andy")
    @guest4 = Guest.new("Bob")
    @guest5 = Guest.new("Sandra")
    @guest6 = Guest.new("Jenny")

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

  def test_play_song
    assert_equal("Master of Puppets now playing", @room1.play_song(@song1))
    assert_equal("Song already playing", @room1.play_song(@song1))
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

end
