require_relative 'book'
require_relative 'label'
require 'json'

class Catalog

  def initialize
    @books = []
  end

  def add_book
    puts 'ADD BOOK'

    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')

    @books.push(Book.new(publish_date, publisher, cover_state))

    puts 'Book added successfully'
  end

  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def load_files
    @books = load_books || []
  end

  def load_books
    JSON.parse(File.read('books.json'), create_additions: true) if File.exist?('books.json')
  end

  def save_files
    File.write('books.json', JSON.generate(@books)) if @books.any?
  end
end