class AddFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :country, :string
    add_column :users, :region, :string
    add_column :users, :city, :string
    add_column :users, :nationality, :string
  end
  
  def down  
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :date_of_birth
    remove_column :users, :country
    remove_column :users, :region
    remove_column :users, :city
    remove_column :users, :nationality
  end
end
