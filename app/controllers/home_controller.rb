class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def provider
    @response = Hash.new
    
    if params.has_key? :time and !params[:time].empty?
      @time = Time.at params[:time].to_f
    else
      @time = Time.now
    end

    @response[:messages] = orderRoomMessages Message.where("created_at > ?", @time).where(:room_id => params[:rooms])
    @response[:time] = Time.now.to_f

    render :json => @response
  end
  
  def history
    @response = Hash.new
    @time = Time.now - 1.day # Default history is 1 day.

    @response[:messages] = orderRoomMessages Message.where("created_at > ?", @time).where(:room_id => params[:rooms])
    @response[:time] = Time.now.to_f

    render :json => @response
  end
  
  private
  
  def orderRoomMessages(message_array)
    rooms = Hash.new
    html = Hash.new
    
    if message_array.length > 0

      message_array.each do |msg|
        if rooms[msg.room_id]
          rooms[msg.room_id] += [ msg ]
        else
          rooms[msg.room_id] = [ msg ]
        end
      end
      
      rooms.each do |key, roomdata|
        html[key] = render_to_string :partial => "messages", :locals => { :messages => roomdata }
      end

    end
    
    return html
  end
end
