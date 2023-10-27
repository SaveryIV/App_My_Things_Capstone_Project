require_relative 'item'
require_relative 'game'
require_relative 'genre'
require_relative 'author'
# require './games.rb'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
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

    print 'Publisher First Name: '
    first_name = gets.chomp.to_s
    print 'Publisher Last Name: '
    last_name = gets.chomp.to_s
    instance_author = Author.new(first_name, last_name)    
    publisher = first_name + ' ' + last_name
    print 'Cover state: '
    cover = gets.chomp.to_s

    book = Book.new(publisher, cover, date)
    @books << book
    instance_author.add_item(book)
    @authors << instance_author
    write_to_file(@authors, './data/authors.json')
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
    print 'Author First Name: '
    first_name = gets.chomp.to_s
    print 'Author Last Name: '
    last_name = gets.chomp.to_s
    publisher = first_name + ' ' + last_name
    instance_author = Author.new(first_name, last_name)    
    game.author = publisher
    @authors << instance_author
    write_to_file(@authors, './data/authors.json')
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

  def create_music_album
    print 'Album title: '
    name = gets.chomp.to_s.upcase
    print 'Artist Name: '
    artist = gets.chomp.to_s
    print 'Publish Date: '
    publish_date = gets.chomp.to_s
    print 'On Spotify [Y/N]? '
    on_spotify = gets.chomp.to_s.upcase

    album = MusicAlbum.new(publish_date, on_spotify)

    print 'Genre name: '
    album.genre = gets.chomp.to_s
    album.author = artist
    @authors << album.author
    album.label = name

    @music << album
    write_to_file(@music, './data/music_album.json')
    puts 'You have createad Successfully a new Album!'
  end

  def display_music_albums
    @music = read_from_file('./data/music_album.json')
    puts 'There is no music album in the store' if @music.empty?
    @music.each_with_index do |album, i|
      puts "#{i + 1}) genre: #{album['genre']}|artist: #{album['author']}
      |album name: #{album['label']}|on spotify: #{album['on_spotify']}|publish date: #{album['publish_date']}"
    end
  end

  def create_genre
    print 'name of the genre: '
    name = gets.chomp.to_s
    genre = Genre.new(name)
    @genres << genre
    write_to_file(@genres, './data/genres.json')
  end

  def list_genres
    @genres = read_from_file('./data/genres.json')
    puts 'Genres list is empty' if @genres.empty?
    @genres.each_with_index do |genre, i|
      puts "#{i}) Name: '#{genre['name']}',  Items: '#{genre['items']}'"
    end
  end
end
