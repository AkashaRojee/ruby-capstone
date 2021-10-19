require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, source, label, publish_date)
    super(source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'on_spotify' => @on_spotify,
      'source' => @source,
      'label' => @label,
      'archived' => @archived 
      'publish_date' => @publish_date,
    }.to_json(*args)
  end
end
