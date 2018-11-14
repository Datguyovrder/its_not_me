class Game < ApplicationRecord
  has_many :rounds
  has_many :roles, through: :rounds
  has_many :participations
  has_many :players, through: :participations
  
  # def welcome
  #   system "clear"
  #   puts "Welcome To It's Not Me!"
  #   puts "The Game Where You Have To Find The Hider!"
  #   puts "But Watch Out For The Decoys!"
  #   puts "******************************************"
  # end

  # def game_finder
  #   puts
  #   puts "Looking For An Empty Lobby!"
  #   sleep(3)
  #   puts "Oh Look, Game 1 Is Empty"
  #   #Futrue version will display all empty games
  #   #Seeker will then start each round
  # end

  def new_round
    people_count = participations.count 

      prompt_id = Prompt.all.sample.id
      current_game_rounds = rounds.count

      created_round = Round.create(
                          game_id: id,
                          prompt_id: prompt_id,
                          game_round: current_game_rounds + 1
                          )

      labels = ["hider", "seeker"]

      (people_count - 2).times do 
        labels << "decoy"
      end

      labels.shuffle!

      players.each_with_index do |player, index|
        Role.create(player_id: player.id, round_id: created_round.id, label: labels[index])
      end

      created_round
  end

  def current_round_id
    rounds.last.id if rounds.any?
  end

  def organizer_id
    participations.find_by(organizer: true) && participations.find_by(organizer: true).player_id
  end
end
