class User < ActiveRecord::Base
  has_many :comments
  has_many :pictures
  has_many :likes
  has_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:minimum => 6, :maximum => 15}

  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  attr_accessible :email, :password, :password_confirmation

  def add_sign_out
    Event.create(:user_id => id,
                 :event_type => "user_sign_out",
                 :info => { :time => Time.now})
  end

end
