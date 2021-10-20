module PromptHandlers
<<<<<<< HEAD
  def prompt_book_details
    puts "\n***ENTER BOOK DETAILS***\n\n"
    publish_date = prompt('Publish date')
    publisher = prompt('Publisher')
    cover_state = prompt('Cover state')
    return publish_date, publisher, cover_state
  end

  def prompt_music_album_details
    puts "\n***ENTER MUSIC ALBUM DETAILS***\n\n"
    publish_date = prompt('Publish date')
    on_spotify = prompt('Album on Spotify [Y/N]')
    return publish_date, on_spotify
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
=======
  def prompt_music_album_details
    puts "\n***ENTER MUSIC ALBUM DETAILS***\n\n"
    print('Is album on Spotify? [y/n]: ')
    on_spotify = gets.chomp.downcase == 'y'

    publish_date = prompt('Publish date')
    [on_spotify, publish_date]
  end

  def prompt_option(text, options)
    puts "\n***SELECT GENRE***\n\n"
>>>>>>> 203671d878a423aa3bb02ceb156f9527a6b215ff
    options&.each_with_index { |option, index| puts "#{index} - #{option}\n" }
    prompt(text)
  end

  def prompt_genre_details
    puts
<<<<<<< HEAD
    puts "***ENTER GENRE DETAILS***"
    puts
    name = prompt('Name')
    return name
  end

  def prompt_author_details
    puts
    puts '***ENTER AUTHOR DETAILS***'
    puts
    first_name = prompt('First name')
    second_name = prompt('Second name')
    return first_name, second_name
  end

  def prompt_label_details
    puts
    puts "***ENTER LABEL DETAILS***"
    puts
    title = prompt('Title')
    color = prompt('color')
    return title, color
=======
    puts '***ENTER GENRE DETAILS***'
    puts
    prompt('Name')
>>>>>>> 203671d878a423aa3bb02ceb156f9527a6b215ff
  end

  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end
end
