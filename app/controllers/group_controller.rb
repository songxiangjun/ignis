class GroupController < LoggedInController
  
  # Sends only grouops that you can administer, currently.
  def index
    groups = current_user.admin_access_groups
    render :json => { :groups => groups, :success => true }
  end
  
  def associated_users
    user_ids = Group.associated_users_array params[:group_id]
    
    render :json => { :users => user_ids, :success => true }
  end
  
  def associate_users
    Group.set_accessible_users params[:group_id], params[:users]
    
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
