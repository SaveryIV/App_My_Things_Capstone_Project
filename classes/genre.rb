require_relative 'item'

class Genre
  attr_reader :items
  attr_accessor :name, :id

  def initialize(name, id)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    return if @items.include?(new_item)

    @items << item
    item.add_genre = self
  end

  def add_genre=(genre)
    @genre = genre
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      items: @items
    }
  end
end
