class GroupController < LoggedInController
  
  def index
    groups = current_user.admin_access_groups
    render :json => { :groups => groups, :success => true }
  end
  
  def create
    newgroup = Group.create params[:group]
    current_user.admin_access_groups << newgroup
    current_user.accessible_groups << newgroup
    return head 201
  end
  
end
