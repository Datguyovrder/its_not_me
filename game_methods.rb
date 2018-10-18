require 'http'

def welcome
  puts "Welcome To It's Not Me!"
  puts "The Game Where You Have To Find The Hider!"
  puts "But Watch Out For The Decoys!"
  puts "******************************************"
end

def game_finder
  puts
  puts "Looking For An Empty Lobby!"
  sleep(3)
  puts "Oh Look, Game 1 Is Empty"
  #Futrue version will display all empty games
  #Seeker will then start each round
end

def display_players
  # Simply displays players name, not their roles
  puts "Here Are The Players"
  response = HTTP.get("http://localhost:3000/api/players")
  response.parse.each do |player|
    puts player["name"]
  end
end

def round
  seeker_screen
  puts
  h_return = hider_screen
  puts
  d_return = decoy_screen

  if (h_return == 1 && d_return == 1)
    if (seeker_guess == 1)
      puts "You Is The WEiner!"
    else
      puts "You Lose, Good Day Sir!"
    end
  end
  # switch statement based on player roles
  # each role will call proper methods
  # MVP will last one round (future 3-5 rounds)
end

def hider_screen
  puts "Please Observe The Decoys And Try To Copy What They Do!"
  done = false

  while (!done)
    print "Type Yes When You Are Done With Task: "
    answer = gets.chomp
    if (answer.capitalize == "Yes")
      done = true
    end
  end

  return 1
end 

def decoy_screen
  # get prompts to decoys
  puts "Here Is Your Prompt, Decoys"
  
  done = false

  while (!done)
    print "Type Yes When You Are Done With Task: "
    answer = gets.chomp
    if (answer.capitalize == "Yes")
      done = true
    end
  end

  return 1
end

def seeker_screen
  #seeker makes a guess on who the hider is
  # if correct seeker wins, otherwise he loses
  puts
  puts "Greeting Seeker!"
  puts "Please Observe The Other Players"
  puts "When They Are Done, Please Choose Who You Think Is The Hider?"


end

def seeker_guess
  puts
  puts "Now Seeker, Who Do Did It?: "
  choice = gets.chomp

  return 1
end
