require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < Minitest::Test

  def setup

    @song = Song.new("Master of Puppets", "Metallica")

  end

  def test_song_name
    assert_equal("Master of Puppets", @song.song_name)
  end

  def test_artist
    assert_equal("Metallica", @song.artist)
  end

end
