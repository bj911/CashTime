class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.datetime :signin_at
      t.datetime :signout_at
      t.string :link
      t.datetime :link_at

      t.timestamps
    end
  end
end
