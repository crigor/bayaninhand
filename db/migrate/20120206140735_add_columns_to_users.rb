class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :middle_name, :string
    add_column :users, :mobile_number, :string
    add_column :users, :gender, :string
  end
end
