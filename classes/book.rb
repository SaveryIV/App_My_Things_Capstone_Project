class Book < Item
    attr_accessor :publisher, :cover_state, :can_be_archived

    def initialize(publisher, cover_state, publish_date)
      super(publish_date)
      @publisher = publisher
      @cover_state = cover_state
    end

    def can_be_archived?
      Item.can_be_archived? || cover_state.downcase == 'bad'
    end
end