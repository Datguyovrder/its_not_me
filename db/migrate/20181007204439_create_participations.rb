class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end
  end
end
