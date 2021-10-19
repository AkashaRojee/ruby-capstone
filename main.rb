require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'source'

class Main
  def initialize
    @items = []
    @sources = []
    @author = []
  end
  def start_app
    choice = show_menu
    choice = show_menu while choice < 1 || choice > 10

    case choice
    when 1 
      # method_1 call
    when 2 
      # method_2 call
    when 3 
      list_all_games
    when 4 
      # method_4 call
    when 5 
      # method_5 call
    when 6 
      # method_6 call
    when 7 
      # method_7 call
    when 8 
      # method_8 call
    when 9 
      add_game
    when 10 
      puts 'Thank you for using this app!'
      return
    end
    start_app
  end

  def show_menu
    options = ['1 - List all books',
               '2 - List all music albums',
               '3 - List all games',
               '4 - List all genres',
               '5 - List all labels',
               '6 - List all sources',
               '7 - Add a book',
               '8 - Add a music album',
               '9 - Add a game',
               '10 - Exit'
              ]

    puts 'Please choose an option by entering a number: ', options
    gets.chomp.to_i
  end
  
  def add_game
    print 'Publish date of game: '
    publish_date = gets.chomp
    print 'Multiplayer game [y - Yes][n - No] ? '
    is_multiplayer =  gets.chomp
    print 'Last played: '
    last_played = gets.chomp

    @items.push(Game.new(publish_date, is_multiplayer, last_played))
    File.open('games.json', 'w') { |f| f.write JSON.generate(@items) }
    start_app
  end

  def list_all_games
    puts 'List of all games: '
     @items.each {|item| puts item}
    start_app
  end

  def parse_games
    puts 'Start parsing...'
    file = 'games.json'

    if File.exist? file
      data = JSON.parse(File.read(file), create_additions: true)
      
      filtered =  data.select{|item| item['json_class']=='Game'}
      filtered.each do |game|
        @items.push(Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']))
      end
    else
      []
    end
  end
end

app = Main.new
app.parse_games
app.start_app
