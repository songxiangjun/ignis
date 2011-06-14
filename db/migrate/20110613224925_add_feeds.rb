class AddFeeds < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.integer :feed_id, :default => 0
      t.index :feed_id
    end
  end
end
