module Concerns::Findable
  def find_by_name(name)
    self.class.all.detect do |song|
      song.name === name
    end
  end
end

def self.find_by_name(name)
  @@all.detect do |song|
    song.name === name
  end
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
end
