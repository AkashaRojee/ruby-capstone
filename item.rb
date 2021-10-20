require 'date'

class Item

  attr_accessor :id, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(0..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)

  end

  def author=(author)
    @author = author
    # AKASHA: after creating Author class - author.items.push(self) 
  end

  def source=(source)
    @source = source
    # AKASHA: after creating Source class - source.items.push(self) 
  end

  def label=(label)
    @label = label
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def to_s
    "Publish date: #{@publish_date}, Archived: #{@archived}\n#{@genre}"
  end

  def to_json(_args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'genre_id' => @genre.id
    }
  end

  private
  def can_be_archived?
    (Date.today() - Date.parse(@publish_date)).to_i/365 > 10
  end
end

