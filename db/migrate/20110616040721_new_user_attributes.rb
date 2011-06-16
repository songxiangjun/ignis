class NewUserAttributes < ActiveRecord::Migration
  def change
    add_column :users, :seen_at,  :datetime
    add_column :users, :is_admin, :boolean
  end
end
