
require_relative 'item'
require_relative 'Genre'
require_relative 'music_album'

module AddHandlers

  def add_genre(item)
    puts 'Select a genre or "n" to add new genre: '
    @genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = Genre.new(gets.chomp)
      @genres.push genre
    else
      genre = @genres[option.to_i]
    end
    item.genre genre
  end  
end