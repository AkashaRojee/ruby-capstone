require 'json'

class Catalog
attr_reader :games, :sources

  def initialize
    @games = []
    @sources = []
  end

  def add_game(game)
    @games.push(game)
  end

  def add_source(source)
    @sources.push(source)
  end

  def list_games
    @games.each { |game| puts game }
  end

  def list_sources
    @sources.each { |source| puts source }
  end

  def load_data
    @games = load_files('games.json')
    @sources = load_files('sources.json')
    load_relationships(@games, @sources)
  end

  def load_files(file)
    if File.exist?(file)
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(games, sources)
    if File.exist?('games.json')
      games_json = JSON.parse(File.read('games.json'))
      games_json.each_with_index do |game_json, index|
        source = sources.detect { |source_json| source_json.id == game_json['source_id'] }
        game = games[index]
        game.source = source
      end
    end
  end

  def save_files
    File.write('games.json', JSON.generate(@games)) if @games.any?
    File.write('sources.json', JSON.generate(@sources)) if @sources.any?
  end
end
