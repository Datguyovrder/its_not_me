class AddGameRoundToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :game_round, :integer
  end
end
