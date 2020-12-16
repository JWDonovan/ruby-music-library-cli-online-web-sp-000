class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    instance = new(name)
    instance.save
    instance
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name === name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def new_from_filename(filename)
    song_info = filename.split(" - ")

    artist = Artist.find_or_create_by_name(song_info["artist"])
    genre = Genre.find_or_create_by_name(song_info["genre"])

    new(song_info["name"], artist, genre)
  end

  def create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end

def self.new_by_filename(filename)
    artist, song_name = filename.split(" - ")
    song = Song.new(song_name)
    song.artist_name = artist
    song
  end
