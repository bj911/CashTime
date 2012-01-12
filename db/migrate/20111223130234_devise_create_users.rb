class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :login
      t.database_authenticatable :null => false
      t.recoverable
      t.trackable


      t.timestamps
    end

    add_index :users, :login,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

end
