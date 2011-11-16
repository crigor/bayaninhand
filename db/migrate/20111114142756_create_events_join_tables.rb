class CreateEventsJoinTables < ActiveRecord::Migration
  def up
    create_table :categories_events, :id => false do |t|
      t.integer :category_id
      t.integer :event_id
    end
    create_table :event_types_events, :id => false do |t|
      t.integer :event_id
      t.integer :event_type_id
    end
  end

  def down
    drop_table :categories_events
    drop_table :event_types_events
  end
end
