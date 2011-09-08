class CreateEventParticipations < ActiveRecord::Migration
  def self.up
    create_table :event_participations do |t|
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :event_participations
  end
end
