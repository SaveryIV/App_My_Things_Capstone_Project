require_relative 'item'
class Game < Item
  attr_accessor :id, :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.new.year - @last_played_at.year) > 2
  end

  def to_json(*_args)
    {
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      genre: @genre,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
