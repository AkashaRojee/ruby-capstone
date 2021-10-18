class Item

  def initialize(source, label, publish_date)
    @id = Random.rand(0..10_000)
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

end