# This class is only used by the User class, and shouldn't need to be broken out unless it gets
# much bigger than an intermediary many-to-many join class.
class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
end

# Users are where all the fun happens. From a user you can find the groups that they belong to,
# and from there you can find the rooms that they have access to.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_many :messages
  has_many :memberships
  has_many :admin_memberships,   :class_name => "Membership",      :conditions => { :is_admin => true }
  has_many :regular_memberships, :class_name => "Membership",      :conditions => { :is_admin => false }
  has_many :admin_access_groups, :through => :admin_memberships,   :source => :group
  has_many :accessible_groups,   :through => :regular_memberships, :source => :group

  # Used on a base model of User in order to find the last five minutes of users that have been seen.
  def self.recent
    users = Array.new
    where("seen_at > ?", Time.now - 5.minutes).select(:username).each { |user| users.push user.username }
    users.sort
  end
  
  # Used on a user that is currently logged in to indicate that they have recently been seen in the system.
  def seen
    update_attribute :seen_at, Time.now
  end

end
