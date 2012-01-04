class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :logo_file_name
      t.integer :logo_file_size
      t.string :logo_content_type
      t.string :name
      t.string :category
      t.boolean :like
      t.datetime :like_at
      t.integer :user_id

      t.timestamps
    end
  end
end
