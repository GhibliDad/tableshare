class AddMessageToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :message, :text
  end
end
