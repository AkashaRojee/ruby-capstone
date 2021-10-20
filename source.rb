class Source
  attr_reader :items
  attr_accessor :id

  def initialize(name)
    @id = Random.rand(0..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end

  def to_s
    "Source - Name: #{@name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    source = new(object['name'])
    source.id = object['id']
    source
  end
end
