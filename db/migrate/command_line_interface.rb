def welcome
   puts "Hello, welcome to NBA Sessions,
    type 1 to search for the NBA's top players, 
    2 to search for the NBA's top coaches,
     type 3 to schedule a workout with a coach: " 
  end

  def get_input_from_user
    # use gets to capture the user's input. This method should return that input, downcased.
    jquery = gets
    jquery
  end
  
  def player_prompt
    puts "please enter a players name"
  end
  
  def coach_prompt
    puts "please enter a coaches name"
  end
  