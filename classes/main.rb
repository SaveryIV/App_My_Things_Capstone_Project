require_relative 'app'

class Menu
  def display
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all labels'
    puts '3 - List all genres'
    puts '4 - List all music albums'
    puts '5 - List all games'
    puts '6 - List all authors'
    puts '7 - Create a book'
    puts '8 - Create a label'
    puts '9 - Create a music album'
    puts '10 - Create a genre'
    puts '11 - Create a game'
    puts '12 - Exit'
  end

  def choice
    print '> '
    gets.chomp
  end
end

class Main
  def initialize(app)
    @app = app
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    menu = Menu.new

    loop do
      menu.display
      choice = menu.choice

      case choice
      when '1' then @app.display_books
      when '2' then @app.display_labels
      when '3' then @app.list_genres
      when '4' then @app.display_musicAlbums
      when '5' then @app.list_of_games
      when '6' then @app.list_of_authors
      when '7' then @app.create_book
      when '8' then @app.create_label
      when '9' then @app.create_musicAlbum
      when '10' then @app.create_genre
      when '11' then @app.add_a_game
      when '12' then break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

main = Main.new(App.new)
main.run