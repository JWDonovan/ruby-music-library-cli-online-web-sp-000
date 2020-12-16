class Genre
  attr_accessor :name

  @@all = []

  def initialize(name:)
    @name = name
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

  def add_song(song:)
    :song.genre = self unless :song.genre
  end
end
