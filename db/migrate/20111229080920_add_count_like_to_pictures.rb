class AddCountLikeToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :count_like, :integer
  end
end
