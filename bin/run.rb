require_relative '../config/environment'
require 'pry'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

# welcome
# user_input = get_input_from_user.strip
# if user_input.to_i == 1
#     player_prompt
#     player = get_input_from_user
#     show_player_info(player)
# elsif user_input.to_i == 2
#     coach_prompt
#     coach = get_input_from_user
#     show_coaches_info(coach)
#     binding.pry
# end
def run 
    welcome 
end 
private

def the_logo 
    puts"       
    
 #     # ######     #    
 ##    # #     #   # #   
 # #   # #     #  #   #  
 #  #  # ######  #     # 
 #   # # #     # ####### 
 #    ## #     # #     # 
 #     # ######  #     #
    
    "
    sleep(1)
    puts "This is your NBA application"
end

