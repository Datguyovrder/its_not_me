class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :prompt_id
      t.integer :game_id

      t.timestamps
    end
  end
end
