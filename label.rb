class Label

  def initialize(title, color)
    @id = Random.rand(0..10_000)
    @title = title
    @color = color
    @items = []
  end
end