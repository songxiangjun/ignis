class GroupController < LoggedInController
  
  # Sends only grouops that you can administer, currently.
  def index
    groups = current_user.admin_access_groups
    render :json => { :groups => groups, :success => true }
  end
  
  def associate
    user = User.find params[:user]
    group = Group.find params[:group_id]
    user.accessible_groups << group
    return head 201
  end
  
  # Anyone can create a group. This needs no more permissions than it has.
  def create
    new_group = Group.create params[:group]
    current_user.admin_access_groups << new_group
    current_user.accessible_groups << new_group
    return head 201
  end
  
end
