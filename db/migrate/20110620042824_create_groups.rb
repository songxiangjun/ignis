class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :memberships do |t|
      t.integer :group_id
      t.integer :user_id
      t.boolean :is_admin
    end
    
    add_column :rooms, :group_id, :integer
  end
end
