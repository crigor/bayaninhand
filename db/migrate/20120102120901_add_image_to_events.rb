class AddImageToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
  end
end
