require 'date'

class Item
  attr_accessor :genre, :author
  def initialize(publish_date)
    @id = Random.rand(0..10_000)
    # @source = source
    # @label = label
    @publish_date = publish_date
    @archived = false
  end

  

  def source=(source)
    @source = source
    source.items.push(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
    # (Date.today() - Date.parse(@publish_date)).to_i/365 > 10
  end
end
