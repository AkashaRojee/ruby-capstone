class Main
  
  def start_app
    choice = show_menu
    choice = show_menu while choice < 1 || choice > 9

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
               '3 - List all movies',
               '4 - List all genres',
               '5 - List all labels',
               '6 - List all authors',
               '7 - Add a book'  
               '8 - Add a music album'  
               '9 - Add a movie'  
              ]

    puts 'Please choose an option by entering a number: ', options
    gets.chomp.to_i
  end
  
end