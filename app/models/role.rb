class Role < ApplicationRecord
  belongs_to :round
  belongs_to :player
  enum label: {seeker: 1, hider: 2, decoy: 3}

  validates :player_id, uniqueness: {scope: :round_id}

  def who_is_hider    
    participaiton_data = HTTP.get("http://localhost:3000/api/games/1")
    parsed_participaiton_data = participation_data.parse

    # for x in 0...parsed_participation_data.length
    #   if parsed_participation_data[x]["label"] == "hider"
    #     return parsed_role_data[x]["player_id"]
    #   end
    # end
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

  def seeker_screen
    #seeker makes a guess on who the hider is
    # if correct seeker wins, otherwise he loses
    puts
    puts "Greeting Seeker!"
    puts "Please Observe The Other Players"
    puts "When They Are Done, Please Choose Who You Think Is The Hider?"
  end

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
end
