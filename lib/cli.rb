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
    
    def display_menu
        puts "Please enter a valid command"
        puts "1. to play a song by name"
        puts "2. to view all artists"
        puts "3. to view all of an artist's songs"
        puts "4. to view an album, and its songs"
        puts "5. to view all artists in a patricular genre"
        # puts "6. to make your own playlist"
        puts "7. to see all songs"
    end

    def play # needs validation for when song does't exist in library
        puts "Enter the song name: "
        song = get_user_input.titleize
        song_instance = Song.find_by(name: song)
        puts "Playing #{song_instance.name}"
        puts "type 'menu' go back to main menu"
    end

    def view_all_artists
        puts "Artists: "
        count = 1
        Artist.all.each{|artist| ap "#{count}. #{artist.name}"
        count += 1
    }
    end
 

    def view_artists_songs
        artist_names = Artist.all.map{|artist| artist.name}
        artist_name = prompt("Select an artist name", artist_names.sort)
        artist_id = Artist.find_by(name: artist_name).id
        songs = Song.where(artist_id: artist_id)
        count = 1
        puts "**************************"
        puts "#{artist_name}'s songs"
        puts "**************************"
         final_answer = songs.each{|song| ap "#{count}. #{song.name}"
         count += 1
        }
    end



    def view_album_songs
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
        genre_name = prompt("Enter the genre's name: ", all_genres)
        artists = Artist.all.where(genre: genre_name)
        puts "**************************"
        puts "For #{genre_name}"
        puts "**************************"
        count = 1
        artists.each do |artist|
            ap "#{count}. #{artist.name}" 
            count += 1
        end
    end

    def make_your_own_playlist
        puts "Enter your album's name: "
        album_name = gets.chomp
        Album.create(name: album_name)
        puts "Which songs do you want to add to your playlist?"
        display_all_songs

    end 

    def display_all_songs
        Song.all.each{|song| puts "-#{song.name}"}
    end

    

    def get_user_input
        gets.chomp
    end

    def welcome 
        greet
        show_logo
        display_menu
    end
    
    def run
        choice = get_user_input.to_i
        if choice == 1
            play
        elsif choice == 2
            view_all_artists  
        elsif choice == 3
            view_artists_songs
        elsif choice == 4
            view_album_songs
        elsif choice == 5
            artist_by_genre
        # elsif choice == 6
        #     make_your_own_playlist
        elsif choice == 7
            display_all_songs
        end
    
        # prompt = TTY::Prompt.new
        # prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
    end
end



