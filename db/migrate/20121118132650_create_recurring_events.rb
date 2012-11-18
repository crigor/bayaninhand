class CreateRecurringEvents < ActiveRecord::Migration
  def change
    create_table :recurring_events do |t|
      t.string   "title"
      t.text     "description"
      t.integer  "organization_id"
      t.text     "address"
      t.date     "start_date"
      t.date     "end_date"
      t.time     "start_time"
      t.time     "end_time"
      t.integer  "volunteers_needed"
      t.string   "status"
      t.string   "frequency"
      t.string   "frequency_day"
      t.timestamps
    end
    change_table :events do |t|
      t.integer "recurring_event_id"
    end
  end
end
