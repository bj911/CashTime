class User < ActiveRecord::Base
  has_many :comments
  has_many :pictures
  has_many :likes
  has_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable

  validates :email, :presence => true
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 4, :on => :create
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "invalid email"

  attr_accessible :email, :password, :password_confirmation
end
