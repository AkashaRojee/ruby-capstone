require 'date'

class Item

  attr_accessor :id
  attr_reader :archived :genre

  def initialize(source, label, publish_date)
    @id = Random.rand(0..10_000)
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private
  def can_be_archived?
    (Date.today() - Date.parse(@publish_date)).to_i/365 > 10
  end
end

