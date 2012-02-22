class CreateCategoriesOrganizationsTable < ActiveRecord::Migration
  def up
    create_table :categories_organizations, :id => false do |t|
      t.integer :category_id
      t.integer :organization_id
    end
  end

  def down
    drop_table :categories_organizations
  end
end
