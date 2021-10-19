module PromptHandlers
  def prompt_book_details
    puts "\n***ENTER BOOK DETAILS***\n\n"
    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')
    return publish_date, publisher, cover_state
  end

  def prompt_option(text, options)
    puts "\n***SELECT LABEL***\n\n"
    options&.each_with_index { |option, index| puts "#{index} - #{option}" }
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
  
  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end
end