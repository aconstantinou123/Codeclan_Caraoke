class Guest

  attr_reader :name, :song
  attr_accessor :wallet

  def initialize(name, wallet, song)
    @wallet = wallet
    @name = name
    @song = song
  end

end
