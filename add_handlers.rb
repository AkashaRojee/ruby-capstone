
require_relative 'item'
require_relative 'genre'
require_relative 'music_album'

module AddHandlers

def add_music_album
  print 'Is album on Spotify? [y/n]: '
  on_spotify = gets.chomp.downcase == 'y'

  print 'Source:'
  source = gets.chomp

  print 'label:'
  label = gets.chomp

  print 'publish_date:'
  publish_date = gets.chomp

  music_album = create_music_album(on_spotify, source, label, publish_date)
  @catalog.add_music_album(music_album)
  add_item(music_album)
  puts "\nSUCCESS: Music Album added\n"

end
  def add_item(item)
    print 'Select a genre or "n" to add new genre: '
    @catalog.genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = create_genre(gets.chomp)
      @catalog.add_genre(genre)
    else
      genre = @catalog.genres[option.to_i]
    end
    item.genre = genre
  end  
end