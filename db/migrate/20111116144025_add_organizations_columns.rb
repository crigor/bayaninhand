class AddOrganizationsColumns < ActiveRecord::Migration
  def up
    change_table :organizations do |t|
      t.string :contact_person
      t.string :phone_number
      t.string :email
      t.string :website
      t.text :mission_statement
    end
  end

  def down
    change_table :organizations do |t|
      t.remove :contact_person
      t.remove :phone_number
      t.remove :email
      t.remove :website
      t.remove :mission_statement
    end
  end
end
