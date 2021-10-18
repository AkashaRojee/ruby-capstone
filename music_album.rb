require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, source, label, publish_date)
    super(source, label, publish_date)
    @on_spotify = on_spotify
    can_be_archived
  end

end