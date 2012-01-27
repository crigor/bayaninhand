class AddCountryToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :country, :string
  end
end
