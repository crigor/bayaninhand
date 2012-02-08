class AddVolunteersNeededToEvents < ActiveRecord::Migration
  def change
    add_column :events, :volunteers_needed, :integer
  end
end
