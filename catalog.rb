require 'json'

class Catalog
  attr_reader :genres

  def initialize
    @music_albums = []
    @genres = []
  end

  def add_music_album(music_album)
    @music_albums.push(music_album)
  end

  def add_genre(genre)
    @genres.push(genre)
  end

  def list_music_album
    @music_albums.each { |ms_album| puts ms_album }
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def load_data
    @music_albums = load_files('music_albums.json')
    @genres = load_files('genres.json')
    load_relationships(@music_albums, @genres)
  end

  def load_files(file)
    if File.exist?(file)
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(music_albums, genres)
    if File.exist?('music_albums.json')
      music_albums_json = JSON.parse(File.read('music_albums.json'))
      music_albums_json.each_with_index do |music_album_json, index|
        genre = genres.detect { |genre_json| genre_json.id == music_album_json['genre_id'] }
        music_album = music_albums[index]
        music_album.genre = genre
      end
    end
  end

  def save_files
    File.write('music_albums.json', JSON.generate(@music_albums)) if @music_albums.any?
    File.write('genres.json', JSON.generate(@genres)) if @genres.any?
  end
end
