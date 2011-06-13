class AddRoomId < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.integer :room_id, :default => 0
      t.index :room_id
    end

  end
end
