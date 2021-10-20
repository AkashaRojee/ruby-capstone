require_relative 'music_album'
require_relative 'genre'

module CreateHandlers

  def create_music_album(args)
    MusicAlbum.new(*args)
  end

  def create_genre(args)
    Genre.new(*args)
  end
end