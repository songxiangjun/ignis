class RoomController < LoggedInController

  def index
    rooms = Room.all
    render :json => { :rooms => rooms, :success => true }
  end
  
  # this really, REALLY needs to check permissions. And soon.
  def create
    new_room = Room.create params[:room]
    target_group = Group.find params[:group]
    target_group.rooms << newroom
    return head 201
  end
  
end
