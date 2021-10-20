require_relative 'item'
require 'time'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "\nAlbum On Spotify: #{@on_spotify}, \n archived: #{@archived} \n publish_date: #{@publish_date} \n #{super}\n"
  end

  # def to_json(*args)
  #               {  JSON.create_id => self.class.name,
  #                 'id' => @id,
  #                 'on_spotify' => @on_spotify,
  #                 'archived' => @archived,
  #                 'publish_date' => @publish_date
  #               }.to_json(*args)
  # end


  def to_json(*args)
    super.merge({  JSON.create_id => self.class.name,
      'id' => @id,
      'on_spotify' => @on_spotify,
      'archived' => @archived,
      'publish_date' => @publish_date
    }).to_json(*args)
  end

  def self.json_create(object)
    music_album = new(object['on_spotify'], Time.parse(object['publish_date']))
    music_album.id = object['id']
    music_album
  end
end
