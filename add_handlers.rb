require_relative 'game'
require_relative 'source'

module AddHandlers
  def add_game_menu
    game_details = prompt_game_details
    game = create_game(game_details)
    @catalog.add_game(game)
    add_item(game)
    puts "\nSUCCESS: Game added\n"
  end

  def add_item(item)
    add_source(item)
  end

  def add_source(item)
    option = prompt_option(
      "\nEnter existing source number or enter N to add new label",
      @catalog.sources
    )

    if option == 'N'
      source_details = prompt_source_details
      source = create_source(source_details)
      @catalog.add_source(source)
    else
      source = @catalog.sources[option.to_i]
    end

    item.source = source
  end
end
