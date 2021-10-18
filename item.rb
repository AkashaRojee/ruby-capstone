require 'date'

class Item

  attr_accessor :genre, :author

  def initialize(source, label, publish_date)
    @id = Random.rand(0..10_000)
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    # AKASHA: after creating Genre class - genre.items.push(self) 
  end

  def author=(author)
    @author = author
    # AKASHA: after creating Author class - author.items.push(self) 
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private
  def can_be_archived?
    today = Date.today()  
    (today-Date.parse(published)).to_i/365 > 10
  end
end

