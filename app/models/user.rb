class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  validates_presence_of :username
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_many :messages
  has_many :feeds, :dependent => :nullify

  def self.recent
    users = Array.new
    where("seen_at > ?", Time.now - 5.minutes).select(:username).each { |user| users.push user.username }
    users.sort()
  end

end
