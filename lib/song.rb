class Song

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist # invokes artist= instead of @artist variable upon initialize if artist given
    self.genre = genre if genre # invokes genre= instead of @genre variable upon initialize if genre given
  end

  def self.all #retrieves class variable @@all
    @@all
  end

  def self.destroy_all #resets/clears class variable @@all to empty array
    @@all.clear
  end

  def save #saves song instance to class variable @@all
    @@all << self
  end

  def self.create (name)
    new(name).tap {|s| s.save}
    # new_song = Song.new(song, artist, genre)

    # song = new(name)
    # song.save
    # return song
  end

  def artist=(artist) # invokes artist and adds itself to artist song collection
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #adds song to genre song collection unless song previous included
  end

  def self.find_by_name (song) # finds song instance in @@all by song name
    self.all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name (song)
    find_by_name(song) || create(song)
  end
    
end
