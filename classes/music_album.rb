require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify === 'y' ? true : false
  end

  private

  def can_be_archived?
    on_spotify?
  end
end