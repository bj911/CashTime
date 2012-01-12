class AddInfo_toEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :string
    add_column :events, :info, :string
  end
end
