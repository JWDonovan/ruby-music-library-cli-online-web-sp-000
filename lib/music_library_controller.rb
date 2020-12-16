class MusicLibraryController
  def initialize(path)
    @path = path
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
  end
end
