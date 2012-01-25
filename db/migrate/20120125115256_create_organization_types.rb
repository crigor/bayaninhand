class CreateOrganizationTypes < ActiveRecord::Migration
  def change
    create_table :organization_types do |t|
      t.string :name
    end
    add_column :organizations, :organization_type_id, :integer
  end
end
