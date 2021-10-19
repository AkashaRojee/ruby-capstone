require 'date'

class Item
  attr_reader :archived
  attr_accessor :id
  def initialize(publish_date)
    @id = Random.rand(0..10_000)
    # @source = source
    # @label = label
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self)
  end

  def author=(author)
    @author = author
    author.items.push(self)
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
  end
end
