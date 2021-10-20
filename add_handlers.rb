require_relative 'item'
require_relative 'book'
require_relative 'game'
require_relative 'source'

module AddHandlers

  def add_book_menu
    book_details = prompt_book_details
    book = create_book(book_details)
    @catalog.add_book(book)
    add_item(book)
    puts "\nSUCCESS: Book added\n"
  end

  def add_game_menu
    game_details = prompt_game_details
    game = create_game(game_details)
    @catalog.add_game(game)
    add_item(game)
    puts "\nSUCCESS: Game added\n"
  end

  def add_item(item)
    add_label(item)
    add_source(item)
  end

  def add_label(item)
  
    option = prompt_option(
      "\nEnter existing label number or enter N to add new label",
      @catalog.labels
    )

    if option == 'N'
      label_details = prompt_label_details
      label = create_label(label_details)
      @catalog.add_label(label)
    else
      label = @catalog.labels[option.to_i]
    end

    item.label = label
  
  end

  def add_source(item)
    option = prompt_option(
      "\nEnter existing source number or enter N to add new source",
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
