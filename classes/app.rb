require './classes/item'
# require './movies.rb'
# require './games.rb'
require './classes/book'
require './classes/label'
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
end
