require_relative 'music_album'

module CreateHandlers

  def create_music_album
    print 'Is album on Spotify? [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'

    print 'Source:'
    source = gets.chomp

    print 'label:'
    label = gets.chomp

    print 'publish_date:'
    publish_date = gets.chomp

    MusicAlbum.new(true, source, label, publish_date)
  end
end
