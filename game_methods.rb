require 'http'

def welcome
  system "clear"
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
  puts "Here Are The Players"
  player_data = HTTP.get("http://localhost:3000/api/players")
  player_data.parse.each do |player|
    puts player["name"]
  end
end

def preset_roles
  roles = ["decoy", "decoy", "hider", "seeker"]
  for x in 1..roles.length
    HTTP.patch("http://localhost:3000/api/roles/#{x}", params: {label: roles.pop()})
  end
end

# def randomize_roles
#   role_data = HTTP.get("http://localhost:3000/api/roles")
#   parsed_role_data = role_data.parse

#   arr = ["seeker","hider","decoy","decoy"].shuffle!
#   for x in 1..parsed_role_data.length
#     HTTP.patch("http://localhost:3000/api/roles/#{x}", params: {label: arr.pop()}) 
#   end
# end

#Role
def who_is_hider
  role_data = HTTP.get("http://localhost:3000/api/roles")
  parsed_role_data = role_data.parse

  for x in 0...parsed_role_data.length
    if parsed_role_data[x]["label"] == "hider"
      return parsed_role_data[x]["player_id"]
    end
  end
end

#Round
def round(input)
  randomize_roles

  seeker_screen
  puts
  h_return = hider_screen
  puts
  d_return = decoy_screen(input)

  if (h_return == 1 && d_return == 1)
    if (seeker_guess == 1)
      puts "You Guessed Correctly"
      hider = who_is_hider
      puts "You Is The WEiner!"
    else
      puts "Nope Nope Nope Nope Nope"
      hider = who_is_hider
      puts "player #{hider} Was The Hider"
      puts "You Lose, Good Day Sir!"
    end
  end
end

#Role
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

def rand_prompt_id
  return (1..10).to_a.shuffle.sample(5)
end

#Role
def decoy_screen(popped_prompt_id)
  done = false

  puts
  puts "Here Is Your Prompt, Decoys"
  prompt_data = HTTP.get("http://localhost:3000/api/prompts/#{popped_prompt_id}")
  p prompt_data.parse["message"]

  while (!done)
    print "Type Yes When You Are Done With Task: "
    answer = gets.chomp
    if (answer.capitalize == "Yes")
      done = true
    end
  end

  return 1
end

#Role
def seeker_screen
  #seeker makes a guess on who the hider is
  # if correct seeker wins, otherwise he loses
  puts
  puts "Greeting Seeker!"
  puts "Please Observe The Other Players"
  puts "When They Are Done, Please Choose Who You Think Is The Hider?"
end

#Role
def seeker_guess 
  role_data = HTTP.get("http://localhost:3000/api/roles")
  parsed_role_data = role_data.parse
  p parsed_role_data

  puts
  print "Now Seeker, Who Done Did It?: "
  choice = gets.chomp.to_i

  index=0
  for x in 0...parsed_role_data.length
    if (parsed_role_data[x]["player_id"] == choice)
      index=x
    end
  end

  return parsed_role_data[index]["label"] == "hider" ? 1 : 0
end
