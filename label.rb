class Label

  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(0..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

end