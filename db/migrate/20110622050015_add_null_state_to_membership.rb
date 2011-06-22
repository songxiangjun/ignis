class AddNullStateToMembership < ActiveRecord::Migration
  def change
    change_column :memberships, :is_admin, :boolean, :default => :false
  end
end
