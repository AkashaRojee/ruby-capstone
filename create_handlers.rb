require_relative 'book'
require_relative 'label'

module CreateHandlers

  def create_book(book_details)
    Book.new(*book_details)
  end

  def create_label(label_details)
    Label.new(*label_details)
  end

end