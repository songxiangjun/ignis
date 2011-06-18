class PollController < LoggedInController

  def provider
    return head :bad_request unless params.has_key? :rooms and !params[:rooms].empty? # Sanity check

    # Time is not required - This could be the initial poll.
    poll_from_time = (params.has_key? :time and !params[:time].empty?) ? Time.at(params[:time].to_f) : Time.now
    rooms          = params[:rooms]
    response       = Hash.new
    messages       = Hash.new

    rooms = hash_messages_by_room Message.where_in_rooms(rooms).where_for_timerange(poll_from_time, Time.now)

    rooms.each do |key, roomdata|
      messages[key] = render_to_string :partial => "home/messages", :locals => { :messages => roomdata }
    end

    response[:messages] = messages
    response[:users] = get_recent_users
    response[:time] = Time.now.to_f

    update_seen_at_time

    render :json => response
  end
  
  private
  
  def get_recent_users
    @users = Array.new
    User.where("seen_at > ?", Time.now - 5.minutes).select(:username).each { |user| @users.push user.username }
    @users.sort().join ', '
  end
  
end
