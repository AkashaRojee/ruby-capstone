require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'source'

module CreateHandlers

  def create_book(book_details)
    Book.new(*book_details)
  end

  def create_label(label_details)
    Label.new(*label_details)
  end

  def create_game(game_details)
    Game.new(*game_details)
  end

  def create_source(source_details)
    Source.new(*source_details)
  end

end
