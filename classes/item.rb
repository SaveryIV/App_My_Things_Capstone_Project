require 'date'

class Item
  attr_accessor :id, :author, :source, :label, :publish_date, :archived, :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.new.year - 10) > @publish_date.year
  end

  def move_to_archive
    result = can_be_archived?
    @archived = true if result
    nil
  end
end