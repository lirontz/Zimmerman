class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username

  has_many :requests, :class_name => "Request", :foreign_key => "user_id"

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :username
end
