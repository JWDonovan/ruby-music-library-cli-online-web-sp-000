class MusicLibraryController
  def initialize(path)
    @path = path
    @importer = MusicImporter.new(path)
  end
end
