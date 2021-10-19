require 'date'

class Item

  attr_accessor :id
  attr_reader :archived :genre, :author, :source, :label

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

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def to_s
    "ID: #{@id}, Author: #{@author}, Genre: #{@genre},  \
    Source: #{@source}, Label: #{@label}, Publish Date: #{@publish_date}"
  end


  def to_json(_args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'author_id' => @author.id,
      'genre_id' => @genre.id,
      'source_id' => @source.id,
      'label_id' => @label.id
    }
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private
  def can_be_archived?
    (Date.today() - Date.parse(@publish_date)).to_i/365 > 10
  end
end

