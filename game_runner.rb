require_relative 'game_methods'

welcome
game_finder
display_players

def rand_prompt_id
  return (1..10).to_a.shuffle.sample(5)
end

prompt_id_array =  rand_prompt_id
# p prompt_id_array 
preset_roles

round_index=1
5.times do
  puts
  puts "Roundo #{round_index}"
  round(prompt_id_array.pop())
  round_index+=1
end



