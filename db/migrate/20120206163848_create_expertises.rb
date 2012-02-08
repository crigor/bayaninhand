class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.string :name
    end
  end
end
