class Picture < ActiveRecord::Base
  has_many :comments
  has_many :users
  has_attached_file :logo, :styles => { :thumb => "128x128>", :big => "500x500>" }

  def liked? user_id
    !Like.find_by_user_id_and_picture_id(user_id, id).blank?
  end

end
