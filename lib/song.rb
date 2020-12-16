class Song
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name:, artist: = nil, genre: = nil)
    @name = name
    @artist = artist if artist
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
end
