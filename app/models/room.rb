class Room < ActiveRecord::Base
  attr_accessible :name, :description, :room_owner

  validates_presence_of :name

  belongs_to :user, :foreign_key => "room_owner"
end
