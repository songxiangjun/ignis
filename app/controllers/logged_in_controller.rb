class LoggedInController < ApplicationController
  before_filter :authenticate_user!


  protected
  
  def hash_messages_by_room(message_array)
    rooms = Hash.new

    if message_array.length > 0

      message_array.each do |msg|
        if rooms[msg.room_id]
          rooms[msg.room_id] += [ msg ]
        else
          rooms[msg.room_id] = [ msg ]
        end
      end

    end
    
    rooms
  end

  def update_seen_at_time
    current_user.seen
  end
  
end
