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
    
    def display_menu
        puts "Please enter a valid command"
        puts "1. to play a song "
        puts "2. to look for an artist"
    end

end

