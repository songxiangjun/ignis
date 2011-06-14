class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end

    change_table :messages do |t|
      t.remove :feed_id

      t.integer :room_id, :default => 0

      t.index :room_id
    end
  end
end
