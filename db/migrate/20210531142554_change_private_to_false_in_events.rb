class ChangePrivateToFalseInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :private, :boolean, default: false
  end
end
