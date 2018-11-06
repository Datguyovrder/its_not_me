class AddOrganizerToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :organizer, :boolean
  end
end
