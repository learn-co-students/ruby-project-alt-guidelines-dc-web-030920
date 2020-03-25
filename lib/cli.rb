require 'pry'
class CommandLineInterface
    
    def greet
        puts "Welcome to Spotify"
        puts "please enter a number to navigate"
    end


    def show_logo
   puts " 
   /$$$$$$                        /$$     /$$  /$$$$$$          
   /$$__  $$                      | $$    |__/ /$$__  $$         
  | $$  \\__/  /$$$$$$   /$$$$$$  /$$$$$$   /$$| $$  \\__//$$   /$$
  |  $$$$$$  /$$__  $$ /$$__  $$|_  $$_/  | $$| $$$$   | $$  | $$
   \\____  $$| $$  \\ $$| $$  \\ $$  | $$    | $$| $$_/   | $$  | $$
   /$$  \\ $$| $$  | $$| $$  | $$  | $$ /$$| $$| $$     | $$  | $$
  |  $$$$$$/| $$$$$$$/|  $$$$$$/  |  $$$$/| $$| $$     |  $$$$$$$
   \\______/ | $$____/  \\______/    \\___/  |__/|__/      \\____  $$
            | $$                                        /$$  | $$
            | $$                                       |  $$$$$$/
            |__/                                        \\______/ "              
   
    end 
    def prompt(string,array)
        prompt = TTY::Prompt.new
        prompt.select(string,array)
    end

    def get_user_input
        gets.chomp
    end

    def welcome 
        greet
        show_logo
    end

    # Exits program
    def exit_program
        puts "Goodbye!!!"
    end

    
    def display_menu
        menu = ["Search song","Artists", "Albums", "Genre", "Songs","To Exit", "Search album" ]
        user_choice = prompt("Select a menu item please: ", menu)
        return user_choice
    end

    #Searches for users input of a song
    def search_song
      puts "Enter the song name:"
      song = get_user_input.titleize
      song_instance = Song.find_by(name: song)
        while !song_instance do
          puts "Invalid, try again:"
          song = get_user_input.titleize
          song_instance = Song.find_by(name: song)
        end
        return song_instance.name
    end


    # Searches for users input of an album
    def search_album
      puts "Enter the album name:"
      album = get_user_input.titleize
      album_instance = Album.find_by(title: album)
        while !album_instance do
          puts "Invalid, try again:"
          album = get_user_input.titleize
          album_instance = Album.find_by(title: album)
        end
        var =  album_instance.title
    end

    #plays a song
    def play(song)# needs validation for when song does't exist in library
        puts "Playing #{song}"
    end

    # Returns a list of artists
    def view_all_artists
        list_of_artists = []
        info_array = Artist.all.each{|artist|  list_of_artists << artist.name}.sort        
       prompt("Artists: ", list_of_artists)
    end
 
    # Returns the songs of an Artist
    def view_artist_songs(artist)
        artist_name = artist
        artist_id = Artist.find_by(name: artist_name).id
        songs = Song.where(artist_id: artist_id).map{|song| song.name}
        puts "**************************"
        puts "**************************"
        prompt("#{artist_name}'s songs", songs)
    end

    # Returns a list of Albums
    def view_all_albums
      list_of_albums = []
        info_array = Album.all.each{|album|  list_of_albums << album.title}.sort        
       prompt("Albums: ", list_of_albums)
    end

    # Returns a list of songs by Album
    def view_album_songs(album)
      album_title = album
      album_id = Album.find_by(title: album_title).id
      songs = Song.where(album_id: album_id).map{|song| song.name}
      puts "**************************"
      puts "**************************"
      prompt("#{album_title}'s songs", songs)
    end

    # Searches with an album's name and returns the songs for the album
    # def search_for_album(album_name)
    #     puts "Enter the album's title: "
    #     album_title = get_user_input.titleize
    #     album_id = Album.all.find_by(title: album_title).id
    #     songs = Song.where(album_id: album_id)
       
    #     puts "**************************"
    #     puts "#{album_title}"
    #     puts "**************************"
    #     count = 1
    #     songs.each do |song|
    #         ap "#{count}. #{song.name}" 
    #         count += 1
    #     end
    # end

    # Returns a list of artists by the selected genre
    def artist_by_genre
        all_genres = Artist.all.map{|artist| artist.genre}.uniq.sort
        genre_name = prompt("Choose a genre: ", all_genres)
        artists = Artist.all.where(genre: genre_name).map{|artist| artist.name}
        puts "**************************"
        puts "For #{genre_name}"
        puts "**************************"
        prompt("Choose an Artist from #{genre_name}", artists)
    end

    # Returns all songs in database
    def display_all_songs
      all_songs = Song.all.map{|song| song.name}.sort
      song_name = prompt("Choose a song: ", all_songs)
    end

    
    def run
        menu_array = ["Search song","Artists", "Albums", "Genre", "Songs","To Exit", "Search album"]
          
            input = ""
            while input
              choice = display_menu
              case choice
              when menu_array[0]
                play(search_song)
              when menu_array[1]
                play(view_artist_songs(view_all_artists))
              when menu_array[2]
                play(view_album_songs(view_all_albums))
              when menu_array[3]
                play(view_artist_songs(artist_by_genre))
              when menu_array[4]
                play(display_all_songs)
              when menu_array[5] #EXIT
                exit_program
                break
              when menu_array[6]
                play(view_album_songs(search_album))
              else
                display_menu
              end
            end

    end


end



