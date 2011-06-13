class RemoveRoomTable < ActiveRecord::Migration
  def change
    remove_column :messages, :room_id
  end
end
