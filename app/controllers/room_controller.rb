class RoomController < LoggedInController

  # Lists only rooms that are accessible to the user.
  def index
    rooms = current_user.rooms
    render :json => { :rooms => rooms, :success => true }
  end
  
  # room[name], room[description] and group must be sent in to use this create method.
  # current_user must have admin access to the group in question.
  def create
    # really need to make sure the group exists.
    
    if Membership.where(:user_id => current_user.id, :group_id => params[:group], :is_admin => true).exists?
      new_room = Room.create params[:room]
      target_group = Group.find params[:group]
      target_group.rooms << new_room
      return head 201
    else
      return head 401
    end
  end
  
end
