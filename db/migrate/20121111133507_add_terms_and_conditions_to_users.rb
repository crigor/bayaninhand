class AddTermsAndConditionsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :terms_and_conditions
    end
  end
end
