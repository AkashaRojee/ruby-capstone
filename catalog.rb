require_relative 'item'
require_relative 'book'
require_relative 'game'
require_relative 'label'
require_relative 'author'
require 'json'

class Catalog

  attr_reader :books, :games, :authors, :labels

  def initialize
    @books = []
    @games = []
    @authors = []
    @labels = []
  end

  def add_book(book)
    @books.push(book)
  end
  
  def add_game(game)
    @games.push(game)
  end

  def add_author(author)
    @authors.push(author)
  end

  def add_label(label)
    @labels.push(label)
  end
  
  def list_books
    @books.each { |book| puts book }
  end
  
  def list_games
    @games.each { |game| puts game }
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def load_data
    @books = load_files('books.json')
    @games = load_files('games.json')

    @authors = load_files('authors.json')
    @labels = load_files('labels.json')

    load_relationships(@books, 'books.json', @authors, @labels)
    load_relationships(@games, 'games.json', @authors, @labels)
  end

  def load_files(file)
    if File.exist?(file)
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(items, file_name, authors, labels)
    if File.exist?(file_name)

      items_json = JSON.parse(File.read(file_name))

      items_json.each_with_index do |item_json, index|

        author = authors.detect { |author_json| author_json.id == item_json['author_id'] }
        label = labels.detect { |label_json| label_json.id == item_json['label_id'] }

        item = items[index]

        item.author = author
        item.label = label

      end
    end
  end

def save_files
    File.write('authors.json', JSON.generate(@authors)) if @authors.any?
    File.write('labels.json', JSON.generate(@labels)) if @labels.any?
    File.write('books.json', JSON.generate(@books)) if @books.any?
    File.write('games.json', JSON.generate(@games)) if @games.any?
  end
end