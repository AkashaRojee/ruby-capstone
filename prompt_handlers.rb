module PromptHandlers
  def prompt_game_details
    puts "\n***ENTER GAME DETAILS***\n\n"
    publish_date = prompt('Publish date')
    multiplayer = prompt('Multiplayer')
    last_played_at = prompt('Last played at')
    return publish_date, multiplayer, last_played_at
  end

  def prompt_option(text, options)
    puts "\n***SELECT SOURCE***\n\n"
    options&.each_with_index { |option, index| puts "#{index} - #{option}\n" }
    prompt(text)
  end

  def prompt_source_details
    puts
    puts "***ENTER SOURCE DETAILS***"
    puts
    name = prompt('Name')
    return name
  end
  
  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end
end