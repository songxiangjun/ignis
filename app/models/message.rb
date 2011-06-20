class Message < ActiveRecord::Base
  validates_presence_of :content, :room_id, :author

  belongs_to :user
  belongs_to :room
  
  def self.where_for_timerange (from, to)
    where("created_at >= :start AND created_at <= :end", {:start => from, :end => to})
  end
  
  def self.where_for_search (terms)
    where("content LIKE ?", "%" + terms + "%")
  end
  
  def self.where_in_rooms (rooms)
    where(:room_id => rooms)
  end
  
  def self.limit_recent
    order("created_at DESC").limit(30)
  end
end
