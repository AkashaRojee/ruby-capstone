require_relative 'item'

class Book < Item

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
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