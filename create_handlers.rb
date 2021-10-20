require_relative 'game'
require_relative 'source'

module CreateHandlers
  def create_game(game_details)
    Game.new(*game_details)
  end

  def create_source(source_details)
    Source.new(*source_details)
  end
end
