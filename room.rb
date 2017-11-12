require("pry")

class Room

  attr_reader :room_name

  def initialize(room_name, guests, song_playing)
    @room_name = room_name
    @guests = guests || []
    @song_playing = song_playing || []
  end

  def favourite_song(guest, song)
      if guest.song == song.song_name
        return "FUCK YEAH! I LOVE THIS SONG!"
    end
  end

  def capacity
    return @guests.length
  end


  def check_in(guest)
    if @guests.length <= 5
    @guests.push(guest)
    guest.wallet -= 5.00
  else
    return "Room at full capacity. Please come back later"
  end
end

  def check_out
    @guests.pop
  end

 # def check_out(guest)
 #   @guests.delete(guest)
 # end


 def play_song(song, guest)
   if @song_playing.empty? && guest.song == song.song_name
     @song_playing.push(song)
     return "#{@song_playing[0].song_name} now playing. #{@song_playing[0].song_name} is #{guest.name}'s favourite song"
   elsif @song_playing.empty?
     @song_playing.push(song)
     return "#{@song_playing[0].song_name} now playing."
   else
     return "Song already playing"
   end
 end

  def stop_song
    if !@song_playing.empty?
      @song_playing.shift
      return "Song stopped"
    end
  end


end
