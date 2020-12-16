class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name:, artist: = nil, genre: = nil)
    @name = name
    @artist = artist if artist
    @genre = genre if genre
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

  def artist=(artist:)
    @artist = :artist
    artist.add_song(self)
  end

  def genre=(genre:)
    @genre = :genre
    genre.add_song(self)
  end
end
