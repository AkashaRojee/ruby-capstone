module PromptHandlers
  def prompt_book_details
    puts "\n***ENTER BOOK DETAILS***\n\n"
    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')
    return publish_date, publisher, cover_state
  end

  def prompt_game_details
    puts "\n***ENTER GAME DETAILS***\n\n"
    publish_date = prompt('Publish date')
    multiplayer = prompt('Multiplayer')
    last_played_at = prompt('Last played at')
    return publish_date, multiplayer, last_played_at
  end

  def prompt_option(text, options)
    puts "\n***SELECT***\n\n"
    options&.each_with_index { |option, index| puts "#{index} - #{option}\n" }
    prompt(text)
  end

  def prompt_label_details
    puts
    puts "***ENTER LABEL DETAILS***"
    puts
    title = prompt('Title')
    color = prompt('color')
    return title, color
  end
  
  def prompt_author_details
    puts
    puts '***ENTER AUTHOR DETAILS***'
    puts
    first_name = prompt('First name')
    second_name = prompt('Second name')
    return first_name, second_name
  end

  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end
end
