class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
end

# Users are central to the application. They have messages and groups (and memberships, which tells about their admin level on a group)
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
