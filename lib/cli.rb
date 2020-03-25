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

    # NEW ******************
    def exit_program
        puts "Goodbye!!!"
    end

    
    def display_menu
        menu = ["Search song","Artists", "Albums", "Genre", "Songs","To Exit" ]
        user_choice = prompt("Select a menu item please: ", menu)
        return user_choice
        # puts "6. to make your own playlist"
    end

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

    def play(song)# needs validation for when song does't exist in library
        puts "Playing #{song}"
    end

    def view_all_artists
        list_of_artists = []
        info_array = Artist.all.each{|artist|  list_of_artists << artist.name}.sort        
       prompt("Artists: ", list_of_artists)
    end
 

    def view_artist_songs(artist)
        artist_name = artist
        artist_id = Artist.find_by(name: artist_name).id
        songs = Song.where(artist_id: artist_id).map{|song| song.name}
        count = 1
        puts "**************************"
        puts "**************************"
        prompt("#{artist_name}'s songs", songs)
    end

    def view_all_albums
      list_of_albums = []
        info_array = Album.all.each{|album|  list_of_albums << album.title}.sort        
       prompt("Albums: ", list_of_albums)
    end

    def view_album_songs(album)
      album_title = album
      album_id = Album.find_by(title: album_title).id
      songs = Song.where(album_id: album_id).map{|song| song.name}
      puts "**************************"
      puts "**************************"
      prompt("#{album_title}'s songs", songs)
    end

    def search_for_album(album_name)
        prompt = TTY::Prompt.new

        puts "Enter the album's title: "
        album_title = get_user_input.titleize
        album_id = Album.all.find_by(title: album_title).id
        songs = Song.where(album_id: album_id)
       
        puts "**************************"
        puts "#{album_title}"
        puts "**************************"
        count = 1
        songs.each do |song|
            ap "#{count}. #{song.name}" 
            count += 1
        end
    end

    def artist_by_genre
        all_genres = Artist.all.map{|artist| artist.genre}.uniq.sort
        genre_name = prompt("Choose a genre: ", all_genres)
        artists = Artist.all.where(genre: genre_name).map{|artist| artist.name}
        puts "**************************"
        puts "For #{genre_name}"
        puts "**************************"
        prompt("Choose an Artist from #{genre_name}", artists)
    end

    # def make_your_own_playlist
    #     puts "Enter your album's name: "
    #     album_name = gets.chomp
    #     Album.create(name: album_name)
    #     puts "Which songs do you want to add to your playlist?"
    #     display_all_songs

    # end 

    def display_all_songs
      all_songs = Song.all.map{|song| song.name}.sort
      song_name = prompt("Choose a song: ", all_songs)
    end

    

  
     
    # # NEW ******************
    # def help
    #     puts "I accept the following commands:"
    #     puts "- Menu"
    #     puts "- Help"
    #     puts "- Search"
    #     puts "- Exit"
    # end

    # def run
    #     menu_array = ["To play a song by name","To view all artists", "To view all songs by artist", "To view all songs by album", "To view all artists by genre", "To see all songs" ]

    #     choice = display_menu
    #     if choice == menu_array[0]
    #         play
    #     elsif choice == menu_array[1]
    #         view_all_artists  
    #     elsif choice == menu_array[2]
    #         view_artists_songs
    #     elsif choice == menu_array[3]
    #         view_album_songs
    #     elsif choice == menu_array[4]
    #         artist_by_genre
    #     # elsif choice == 6
    #     #     make_your_own_playlist
    #     elsif choice == menu_array[5]
    #         display_all_songs
    #     end
    
    #     # prompt = TTY::Prompt.new
    #     # prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
    # end
    def run
        menu_array = ["Search song","Artists", "Albums", "Genre", "Songs","To Exit" ]
          
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
              else
                display_menu
              end
            end

    end


end



