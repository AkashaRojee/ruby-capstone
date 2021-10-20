module PromptHandlers
  def prompt_music_album_details
    puts "\n***ENTER MUSIC ALBUM DETAILS***\n\n"
    print('Is album on Spotify? [y/n]: ')
    on_spotify = gets.chomp.downcase == 'y'

    publish_date = prompt('Publish date')
    [on_spotify, publish_date]
  end

  def prompt_option(text, options)
    puts "\n***SELECT GENRE***\n\n"
    options&.each_with_index { |option, index| puts "#{index} - #{option}\n" }
    prompt(text)
  end

  def prompt_genre_details
    puts
    puts '***ENTER GENRE DETAILS***'
    puts
    prompt('Name')
  end

  def prompt(data_item)
    print "#{data_item}: "
    gets.chomp
  end
end
