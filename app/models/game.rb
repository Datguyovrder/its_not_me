class Game < ApplicationRecord
  has_many :rounds
  has_many :roles, through: :rounds
  has_many :participations
  has_many :players, through: :participations
  
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

  def new_round
    possible_roles = ["seeker","hider","decoy","decoy"].shuffle!
    # last_roles = rounds.last.roles if rounds.any? #this could lead to not repeating the last roles
    round = Round.create(game_id: id, prompt_id: Prompt.all.sample.id)
    players.each_with_index do |player, index|
      Role.create(player_id: player.id, label: possible_roles[index])
    end
  end
end
