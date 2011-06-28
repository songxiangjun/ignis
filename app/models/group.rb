class Group < ActiveRecord::Base
  has_many :rooms
  has_many :memberships
  has_many :users, :through => :memberships
  
  def self.associated_users_array(group_id)
    user_ids = Array.new
    
    find(group_id).users.select('users.id').each do |u| 
      user_ids.push u.id
    end
    
    user_ids.uniq
  end
  
  def self.set_accessible_users group_id, user_id_array
    group = find(group_id)
    
    group.users.each do |user|
      if user_id_array.include? user.id.to_s
        user_id_array.delete user.id.to_s
      else
        user.accessible_groups.delete group
      end
    end
    
    group.users << User.where(:id => user_id_array)
  end
  
end
