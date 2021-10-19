require_relative 'item'

class Book < Item

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "Source: #{@source}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  private
  def can_be_archived?
    if super || cover_state == 'bad'
      true
    else
      false
    end
  end
  
end