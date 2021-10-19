require_relative 'add_handlers'
require_relative 'create_handlers'

class Main

  def initialize
    @music_albums = []
    @genres = []
  end

  include CreateHandlers
  include AddHandlers

  def start_app
    puts "Welcome to the catalog!\n"

    loop do
      show_menu
      choice = get_choice
      break if choice == 10
      handle_choice(choice)
    end

    puts "\nThank you for using the catalog!\n"

  end

  def show_menu
    puts "\n***************\n***MAIN MENU***\n***************\n\n"
    puts [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all games',
      '4 - List all labels',
      '5 - List all genres',
      '6 - List all authors',
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a game',
      '10 - Exit'
    ]
  end

  def get_choice
    print "\nPlease choose an option by entering a number from 1 to 10: "
    gets.chomp.to_i
  end
  
  def list_music_album
    @music_albums.each { |ms_album| puts ms_album }
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def handle_choice(choice)
    case choice
    when 1 
      # method_1 call
    when 2 
      # method_2 call
      list_music_album
    when 3 
      # method_3 call
    when 4 
      # method_4 call
    when 5 
      # method_5 call
      list_genres
    when 6 
      # method_6 call
    when 7
      # method_7 call
    when 8 
      # method_8 call
      add_music_album
    when 9 
      # method_9 call
    else
      puts "\nERROR: Invalid option. See available options below.\n"
    end
  end
end

Main.new.start_app