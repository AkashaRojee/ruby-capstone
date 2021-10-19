require_relative 'book'

class Catalog

  def initialize
    @books = []
  end

  def add_book
    puts 'ADD BOOK'

    source = prompt('Source')
    label = prompt('Label')
    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')

    @books.push(Book.new(source, label, publish_date, publisher, cover_state))

    puts 'Book added successfully'
  end

  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end

  def list_books
    @books.each { |book| puts book }
  end
end