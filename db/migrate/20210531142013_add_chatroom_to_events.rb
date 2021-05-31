class AddChatroomToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :chatroom, null: false, foreign_key: true
  end
end
