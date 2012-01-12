class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  default_scope order("created_at DESC")
end
