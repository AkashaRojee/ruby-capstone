require_relative 'catalog'

class Main

  def initialize
    @catalog = Catalog.new
  end
  
  def start_app
    @catalog.save_files
    choice = 0;

    until choice == 10
      show_menu

      choice = get_choice
      choice = get_choice while choice < 1 || choice > 10

      handle_choice(choice)
    end

  end

  def show_menu
    options = [
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
    puts options
  end

  def get_choice
    print 'Please choose an option by entering a number from 1 to 10: '
    gets.chomp.to_i
  end
  
  def handle_choice(choice)
    case choice
    when 1 
      @catalog.list_books
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
      @catalog.add_book
    when 8 
      # method_8 call
    when 9 
      # method_9 call
    when 10
      @catalog.save_files
    end
  end
end
Main.new.start_app