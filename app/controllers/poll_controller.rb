class PollController < LoggedInController

  def provider
    return head :bad_request unless params.has_key? :rooms and params[:rooms].instance_of? Array and not params[:rooms][0].empty? # Sanity check

    # Time is not required - This could be the initial poll.
    poll_from_time = (params.has_key? :time and !params[:time].empty?) ? Time.at(params[:time].to_f) : Time.now
    rooms          = params[:rooms]
    messages       = Hash.new

    rooms = hash_messages_by_room Message.where_in_rooms(rooms).where_for_timerange(poll_from_time, Time.now)

    rooms.each do |key, roomdata|
      messages[key] = render_to_string :partial => "home/messages", :locals => { :messages => roomdata }
    end

    update_seen_at_time
    render :json => { :messages => messages, :users => User.recent.join(', '), :time => Time.now.to_f }
  end
  
end
