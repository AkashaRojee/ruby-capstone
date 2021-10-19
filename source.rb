class Source
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(0..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end
end
