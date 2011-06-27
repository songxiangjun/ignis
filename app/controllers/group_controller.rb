class GroupController < LoggedInController
  
  # Sends only grouops that you can administer, currently.
  def index
    groups = current_user.admin_access_groups
    render :json => { :groups => groups, :success => true }
  end
  
  def associated_users
    user_ids = Array.new
    Group.find(params[:group_id]).users.select('users.id').each { |u| user_ids.push u.id }
    
    render :json => { :users => user_ids.uniq, :success => true }
  end
  
  def associate_users
    group = Group.find params[:group_id]
    userlist = params[:users]
    
    # Do the removal first.
    group.users.each do |user|
      if userlist.include? user.id.to_s
        userlist.delete user.id.to_s
      else
        user.accessible_groups.delete group
      end
    end

    # Now add the users that are left.
    User.where(:id => userlist) { |user| user.accessible_groups << group }
    
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
