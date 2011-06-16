class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def provider
    @response = Hash.new
    messages = Hash.new
    
    if params.has_key? :time and !params[:time].empty?
      @time = Time.at params[:time].to_f
    else
      @time = Time.now
    end

    rooms = order_room_messages Message.where("created_at > ?", @time).where(:room_id => params[:rooms])

    rooms.each do |key, roomdata|
      messages[key] = render_to_string :partial => "messages", :locals => { :messages => roomdata }
    end

    @response[:messages] = messages
    @response[:users] = get_recent_users
    @response[:time] = Time.now.to_f

    update_seen_at_time

    render :json => @response
  end
  
  def history
    @response = Hash.new
    @time = Time.now - 1.day # Default history is 1 day.
    @current = Time.now
    messages = Hash.new

    order_room_messages(Message.where("created_at > ?", @time).where(:room_id => params[:rooms])).each do |key, msgs|
      messages[key] = render_to_string :partial => "history", :locals => { :fromdate => @time, :todate => @current, :messages => msgs }
    end

    @response[:messages] = messages
    @response[:time] = @current.to_f

    render :json => @response
  end
  
  private
  
  def order_room_messages(message_array)
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
    current_user.seen_at = Time.now
    current_user.save
  end

  def get_recent_users
    @users = Array.new
    User.where("seen_at > ?", Time.now - 5.minutes).select(:username).each { |user| @users.push user.username }
    @users.sort().join ', '
  end
end
