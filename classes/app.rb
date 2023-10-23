#require './item.rb'
#require './movies.rb'
#require './games.rb'
#require './books.rb'
#require './music_album.rb'

class App 
    def initialize
      @all_items = []
    end

    def create_book
    print 'Date of publishing: '
    date = gets.chomp

    book = Book.new(date)
    @all_items << book
    puts 'Item Created Successfully'
    end

    def create_musicAlbum
      print 'Date of publishing: '
      date = gets.chomp
    
      album = MusicAlbum.new(date)
      @all_items << album
      puts 'Item Created Successfully'
    end

    def create_movie
      print 'Date of publishing: '
      date = gets.chomp

      movie = Movie.new(date)
      @all_items << movie
      puts 'Item Created Successfully'
    end

    def create_game
      print 'Date of publishing: '
      date = gets.chomp

      game = Game.new(date)
      @all_items << game
      puts 'Item Created Successfully'
    end
end