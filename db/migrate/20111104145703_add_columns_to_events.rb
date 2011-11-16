class AddColumnsToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.text :address
      t.string :map
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
    end
  end
end
