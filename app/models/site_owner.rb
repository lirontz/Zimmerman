class SiteOwner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :birthday, :gender, :phone, :terms_of_use_confirmed, :sms_enabled

  has_many :sites, :class_name => "Site", :foreign_key => "site_owner_id"

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :username
end
