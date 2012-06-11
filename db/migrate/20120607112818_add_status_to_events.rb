class AddStatusToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :status
    end
  end
end
