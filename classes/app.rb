require_relative 'item'
require_relative 'game'
# require './movies.rb'
# require './games.rb'
require_relative 'book'
require_relative 'label'
# require './music_album.rb'
require_relative 'preserve_data'

class App
  def initialize
    @books = []
    @music = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def create_book
    print 'Date of publishing: '
    date = gets.chomp.to_s

    print 'Publisher: '
    publisher = gets.chomp.to_s

    print 'Cover state: '
    cover = gets.chomp.to_s

    @books << Book.new(publisher, cover, date)
    puts @books
    write_to_file(@books, './data/books.json')
    puts 'Book Created Successfully'
  end

  def display_books
    @books = read_from_file('./data/books.json')
    puts 'Book list is empty' if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i}) Publisher: #{book['publisher']}, Cover state: #{book['cover_state']}, Publish date: #{book['publish_date']}"
    end
  end

  def create_label
    print 'Title: '
    title = gets.chomp.to_s

    print 'Color: '
    color = gets.chomp.to_s

    @labels << Label.new(title, color)
    puts @labels
    write_to_file(@labels, './data/labels.json')
    puts 'Label Created Successfully'
  end

  def display_labels
    @labels = read_from_file('./data/labels.json')
    puts 'Label list is empty' if @labels.empty?
    @labels.each_with_index do |label, i|
      puts "#{i}) Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def add_a_game
    puts 'Enter the following information for the new game:'
    print 'Multiplayer (true/false): '
    multiplayer = gets.chomp
    print 'Last Played Date (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = Date.parse(gets.chomp)

    # Create a new Game object with the provided arguments
    game = Game.new(multiplayer, last_played_at, publish_date)

    print 'Genre: '
    game.genre = gets.chomp
    print 'Author: '
    game.author = gets.chomp
    print 'Source: '
    game.source = gets.chomp
    print 'Label: '
    game.label = gets.chomp
    print 'Archived (true/false): '
    game.archived = gets.chomp

    @games << game
    write_to_file(@games, './data/games.json')
    # File.write('games.json', JSON.generate(@games))
    puts 'New game added successfully'
  end

  def list_of_games
    @games = read_from_file('./data/games.json')
    puts 'There is no games in the store' if @games.empty?
    @games.each_with_index do |game, i|
      puts "#{i + 1} genre: #{game['genre']}|author: #{game['author']}
      | source: #{game['source']}| label: #{game['label']} | multiplayer: #{game['multiplayer']}|
       last played: #{game['last_played_at']}"
    end
  end

  def list_of_authors
    @authors = read_from_file('./data/authors.json')
    @authors.each_with_index do |author, i|
      puts "#{i + 1} | First Name: #{author['first_name']}| Last Name: #{author['last_name']}"
    end
  end
end
