require_relative 'item'
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

  def load_data
    @books = load_files('books.json')
    @labels = load_files('labels.json')
    load_relationships(@books, @labels)
  end

  def load_files(file)
    if File.exist?(file)
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(books, labels)
    if File.exist?('books.json')
      books_json = JSON.parse(File.read('books.json'))
      books_json.each_with_index do |book_json, index|
        label = labels.detect { |label_json| label_json.id == book_json['label_id'] }
        book = books[index]
        puts label
        book.label = label
      end
    end
  end

def save_files
    File.write('books.json', JSON.generate(@books)) if @books.any?
    File.write('labels.json', JSON.generate(@labels)) if @labels.any?
  end
end