class ChangeUserAdminDefault < ActiveRecord::Migration
  def change
    change_column :users, :is_admin, :boolean, :default => false
    User.update_all ["is_admin = ?", false]
  end
end
