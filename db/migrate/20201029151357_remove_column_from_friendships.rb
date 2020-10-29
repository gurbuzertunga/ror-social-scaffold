class RemoveColumnFromFriendships < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :friend_id, :integer
    remove_column :friendships, :user_id, :integer
  end
end
