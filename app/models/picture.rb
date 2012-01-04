class Picture < ActiveRecord::Base
  has_many :comments
  has_many :users
  has_attached_file :logo, :styles => { :thumb => "128x128>" }
end
