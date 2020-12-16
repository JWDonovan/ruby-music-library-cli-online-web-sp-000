class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def destroy_all
    @@all.clear
  end

  def create(name)
    instance = self.new(name)
    save
  end
end
