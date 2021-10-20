require_relative 'genre'
require_relative 'music_album'

module AddHandlers
  def add_music_album_menu
    music_album_details = prompt_music_album_details
    music_album = create_music_album(music_album_details)
    @catalog.add_music_album(music_album)
    add_item(music_album)
    puts "\nSUCCESS: Music album added\n"
  end

  def add_item(item)
    add_genre(item)
  end

  def add_genre(item)
    option = prompt_option(
      "\nEnter existing source number or enter N to add new label",
      @catalog.genres
    )

    if option == 'N'
      genre_details = prompt_genre_details
      genre = create_genre(genre_details)
      @catalog.add_genre(genre)
    else
      genre = @catalog.genres[option.to_i]
    end

    item.genre = genre
  end
end
