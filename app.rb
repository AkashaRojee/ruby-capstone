require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'source'

module App
  def add_game
    print 'Publish date of game: '
    publish_date = gets.chomp
    print 'Multiplayer game [y - Yes][n - No] ? '
    is_multiplayer = gets.chomp.downcase=='y'
    print 'Last played: '
    last_played = gets.chomp

    @items.push(Game.new(publish_date, is_multiplayer, last_played))
    start_app
  end

  def list_all_games
    puts 'List of all games: '
    @items.each { |item| puts item }
    start_app
  end

  def parse_games
    file = 'games.json'

    if File.exist? file
      data = JSON.parse(File.read(file), create_additions: true)

      filtered = data.select { |item| item['json_class'] == 'Game' }
      filtered.each do |game|
        @items.push(Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']))
        @items.last.id = game['id']
      end
    else
      []
    end
  end

  def save_data
    File.open('games.json', 'w') { |f| f.write JSON.generate(@items) }
  end
end