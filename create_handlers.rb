require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'

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

  def create_author(author_details)
    Author.new(*author_details)
  end

end
