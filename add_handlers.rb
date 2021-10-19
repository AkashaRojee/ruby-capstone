
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
  @music_albums.push(music_album)
  add_genre(music_album)
  puts "\nSUCCESS: Music Album added\n"

end
  def add_genre(item)
    puts 'Select a genre or "n" to add new genre: '
    @genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = create_genre(gets.chomp)
      @genres.push genre
    else
      genre = @genres[option.to_i]
    end
    item.genre = genre
  end  
end