require_relative 'item'

class Game < Item
  def initialize(publish_date, multiplayer, last_played_at)
    super(@publish_date = publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    "[Game] Publish date: #{@publish_date} Multiplayer: #{@multiplayer} Last played: #{@last_played_at}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
