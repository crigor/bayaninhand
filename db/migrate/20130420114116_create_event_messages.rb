class CreateEventMessages < ActiveRecord::Migration
  def change
    create_table :event_messages do |t|
      t.text :body
      t.string :sender_email
      t.references :user
      t.references :participation
      t.timestamps
    end
  end
end
