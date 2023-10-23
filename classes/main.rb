#require './app.rb'

class Menu
  def display
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all movies'
    puts '3 - List all music albums'
    puts '4 - List all games'
    puts '5 - Create a book'
    puts '6 - Create a movie'
    puts '7 - Create a music album'
    puts '8 - Create a game'
    puts '9 - Exit'
  end

  def choice
    print '> '
    gets.chomp
  end
end

class Main
#entry point
  def initialize(app)
    @app = app
  end

  def run
    menu = Menu.new

    loop do
      menu.display
      choice = menu.choice

      case choice
      when '1' then @app.display_books
      when '2' then @app.display_movies
      when '3' then @app.display_musicAlbums
      when '4' then @app.display_games

      when '5' then @app.create_book
      when '6' then @app.create_movie
      when '7' then @app.create_musicAlbum
      when '8' then @app.create_game
      when '9' then break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
  end
end

main = Main.new(App.new)
main.run
