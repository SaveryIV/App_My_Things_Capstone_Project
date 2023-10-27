require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify == 'Y' 
  end

  def to_json(*_args)
    {
      id: @id,
      genre: @genre,
      author: @author,
      label: @label,
      on_spotify: @on_spotify,
      publish_date: @publish_date
    }
  end

  private

  def can_be_archived?
    on_spotify?
  end
end
