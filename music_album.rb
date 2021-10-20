require_relative 'item'

class MusicAlbum < Item

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_s
    "\n[MUSIC ALBUM ID #{@id}]\nOn Spotify: #{@on_spotify}\n#{super}\n"
  end

  def to_json(*args)
<<<<<<< HEAD
                {  JSON.create_id => self.class.name,
                  'id' => @id,
                  'on_spotify' => @on_spotify,
                  'source' => @source,
                  'label' => @label,
                  'archived' => @archived,
                  'publish_date' => @publish_date
                }.to_json(*args)
  end

  def self.json_create(object)
    music_album = new(object['on_spotify'], object['source'], object['label'],
                      Date.parse(object['publish_date']))
=======
    super.merge({
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify
    }).to_json(*args)
  end

  def self.json_create(object)
    music_album = new(Date.parse(object['publish_date']), object['on_spotify'])
>>>>>>> 0b78b01fb25ea87bf82c9b5ef56f956eff656d40
    music_album.id = object['id']
    music_album
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
