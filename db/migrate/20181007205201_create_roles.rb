class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :label

      t.timestamps
    end
  end
end
