require_relative 'game'
require_relative 'author'
require_relative 'source'

class Main
  
  def start_app
    choice = show_menu
    choice = show_menu while choice < 1 || choice > 10

    case choice
    when 1 
      # method_1 call
    when 2 
      # method_2 call
    when 3 
      # method_3 call
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
      # method_9 call
    end
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
  
end

# Main.new.start_app

game = Game.new('2015/05/05', 'yes', '2018/08/08')
source = Source.new('Online shop')
author = Author.new('Martin', 'Eden')

author.add_item(game)
# source.add_item(game)
game.source = source
puts game.author.first_name
puts game.source.name
# puts source.name