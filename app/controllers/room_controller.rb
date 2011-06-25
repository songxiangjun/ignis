class RoomController < LoggedInController

  # Need to refactor so that it also sends the group name and id back with it... AND takes permissions in to account!
  def index
    rooms = Room.all
    render :json => { :rooms => rooms, :success => true }
  end
  
  # this really, REALLY needs to check permissions. And soon. Real soon.
  # You can only create a room in a group IF you have admin access to that group.
  def create
    new_room = Room.create params[:room]
    target_group = Group.find params[:group]
    target_group.rooms << newroom
    return head 201
  end
  
end
