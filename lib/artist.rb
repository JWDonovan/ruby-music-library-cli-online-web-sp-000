class Artist
  attr_accessor :name

  @@all = []

  def initialize(name:)
    @name = name
    @songs = []
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

  def songs
    Song.all.select do |song|
      song.artist === self
    end
  end

  def add_song(song:)
    :song.artist = self unless :song.artist
  end
end
