require_relative 'book'
require_relative 'label'
require 'json'

class Catalog

  attr_reader :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book(book)
    @books.push(book)
  end

  def add_label(label)
    @labels.push(label)
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