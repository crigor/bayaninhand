class CreateOrganizationRoles < ActiveRecord::Migration
  def self.up
    create_table :organization_roles do |t|
      t.string :role
      t.integer :user_id
      t.integer :organization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :organization_roles
  end
end
