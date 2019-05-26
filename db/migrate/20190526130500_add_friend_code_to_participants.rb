class AddFriendCodeToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :friend_code, :citext, null: false, unique: true
  end
end
