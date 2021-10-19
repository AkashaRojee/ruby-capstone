require_relative 'item'
require_relative 'book'

module AddHandlers

  def add_book_menu
    book_details = prompt_book_details
    book = create_book(book_details)
    @catalog.add_book(book)
    add_item(book)
    puts "\nSUCCESS: Book added\n"
  end

  def add_item(item)
    add_label(item)
  end

  def add_label(item)
  
    option = prompt_option(
      "Enter existing label number or enter N to add new label",
      @labels
    )

    if option == 'N'
      label_details = prompt_label_details
      label = create_label(label_details)
      @catalog.add_label(label)
    else
      label = @labels[option.to_i]
    end

    item.label = label
  
  end



  
end