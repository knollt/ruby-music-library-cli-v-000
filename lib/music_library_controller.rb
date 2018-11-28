class MusicLibraryController

  def initialize(path)
    MusicImporter.new(path).import
  end

end
