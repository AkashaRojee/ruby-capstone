require 'date'

class Item
  attr_accessor :genre, :author

  def initialize(_source, _label, publish_date)
    @id = Random.rand(0..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  attr_writer :author

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
