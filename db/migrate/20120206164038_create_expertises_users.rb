class CreateExpertisesUsers < ActiveRecord::Migration
  def change
    create_table :expertises_users, :id => false do |t|
      t.integer :user_id
      t.integer :expertise_id
    end
  end
end
