class Item do
    attr_accessor :id, :author, :source, :label, :publish_date, :archived

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
        (Time.new.year - @publish_date.year) > 10
    end

    def move_to_archive
      result = can_be_archived?
      if result
        @archived = true
      end
      nil
    end
end
